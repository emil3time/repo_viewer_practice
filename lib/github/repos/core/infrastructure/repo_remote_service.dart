import 'package:dio/dio.dart';
import 'package:repo_viewer/core/infrastructure/dio_extensions.dart';
import 'package:repo_viewer/core/infrastructure/network_exceptions.dart';
import 'package:repo_viewer/core/infrastructure/remote_response.dart';
import 'package:repo_viewer/github/core/infrastructure/github_headers.dart';
import 'package:repo_viewer/github/core/infrastructure/github_headers_cache.dart';
import 'package:repo_viewer/github/core/infrastructure/github_repo_dto.dart';
import 'package:repo_viewer/github/core/infrastructure/pagination_config.dart';

abstract class RepoRemoteService {
  final Dio _dio;
  final GithubHeadersCache _headersCache;

  RepoRemoteService(
    this._dio,
    this._headersCache,
  );

  // now token and acceptHeader comes from initializationProvider
  // -directly from interceptor and BaseOptions
  Future<RemoteResponse<List<GithubRepoDTO>>> getPage({
    required Uri requestUrl,
    required List<dynamic> Function(dynamic json) jsonDataSelector,
  }) async {

    /*   const token = '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';
    const acceptHeader = 'application/vnd.github.html+json'; */
    final previousHeaders = await _headersCache.read(requestUrl);

    try {
      final response = await _dio.getUri(
        requestUrl,
        options: Options(
          headers: {
            /*   'Authorization': 'bearer $token',
            'Accept': acceptHeader, */
            'If-None-Match': previousHeaders?.eTag ?? '',
          },
        ),
      );
      if (response.statusCode == 304) {
        return RemoteResponse.noChanges(
          maxPage: previousHeaders?.link?.maxPage ?? 0,
        );
      } else if (response.statusCode == 200) {
        final headers = GithubHeaders.parse(response);

        await _headersCache.save(
          requestUrl,
          headers,
        );

        final convertedData = jsonDataSelector(response.data)
            .map((e) => GithubRepoDTO.fromJson(e as Map<String, dynamic>))
            .toList();

        return RemoteResponse.witchNewData(
          convertedData,
          maxPage: headers.link?.maxPage ?? 1,
        );
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.isNoInternetConnection) {
        return const RemoteResponse.noConnection();
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }
}
