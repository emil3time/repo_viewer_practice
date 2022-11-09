import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:repo_viewer/core/infrastructure/dio_extensions.dart';
import 'package:repo_viewer/core/infrastructure/network_exceptions.dart';
import 'package:repo_viewer/core/infrastructure/remote_response.dart';
import 'package:repo_viewer/github/core/infrastructure/github_headers.dart';
import 'package:repo_viewer/github/core/infrastructure/github_headers_cache.dart';

class GithubRepoDetailRemoteService {
  final Dio _dio;
  final GithubHeadersCache _headersCache;

  GithubRepoDetailRemoteService(this._dio, this._headersCache);

  Future<RemoteResponse<String>> getReadmeHtml(String fullName) async {
    final requestUri = Uri.https(
      'api.github.com',
      '/repos/$fullName/readme',
    );

    final previousHeaders = await _headersCache.read(requestUri);

    try {
      final response = await _dio.getUri(
        requestUri,
        options: Options(
          headers: {'If-None-Match': previousHeaders?.eTag ?? ''},
          responseType: ResponseType.plain,
        ),
      );

      if (response.statusCode == 304) {
        return const RemoteResponse.noChanges(maxPage: 0);
      } else if (response.statusCode == 200) {
        final newHeaders = GithubHeaders.parse(response);
        await _headersCache.save(requestUri, newHeaders);

        final html = response.data as String;
        return RemoteResponse.witchNewData(html, maxPage: 0);
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.isNoInternetConnection) {
        return const RemoteResponse.noConnection();
      } else if (e.response?.statusCode != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }

  /// if return 'null' there is no Internet Connection
  Future<bool?> getStarredStatus(String fullName) async {
    final requestUri = Uri.https(
      'api.github.com',
      '/starred/repos/$fullName',
    );

    try {
      final response = await _dio.getUri(
        requestUri,
        options: Options(
          validateStatus: (status) =>
              (status != null && status > 200 && status < 400) || status == 404,
        ),
      );

      if (response.statusCode == 404) {
        return true;
      } else if (response.statusCode == 204) {
        return false;
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.isNoInternetConnection) {
        return null;
      } else if (e.response?.statusCode != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }

  /// if return 'null' there is no Internet Connection
  Future<Unit?> switchStarredStatus(
    String fullName, {
    required bool isAlreadyStarred,
  }) async {
    final requestUri = Uri.https(
      'api.github.com',
      '/starred/repos/$fullName',
    );

    try {
      final response = isAlreadyStarred
          ? await _dio.putUri(
              requestUri,
              options: Options(
                headers: {
                  'Content-Length': 0,
                },
              ),
            )
          : await _dio.deleteUri(requestUri);

      if (response.statusCode == 204) {
        return unit;
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.isNoInternetConnection) {
        return null;
      } else if (e.response?.statusCode != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }
}
