import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_headers.freezed.dart';
part 'github_headers.g.dart';

@freezed
class GithubHeaders with _$GithubHeaders {
  const GithubHeaders._();
  const factory GithubHeaders({
    String? eTag,
    PaginationLink? link,
  }) = _GithubHeaders;

  factory GithubHeaders.parse(Response response) {
    final link = response.headers.map['Link']?[0].split(',');
    return GithubHeaders(
      eTag: response.headers.map['ETag']?[0],
      link: link == null
          ? null
          : PaginationLink.parse(
              link,
              requestUrl: response.requestOptions.uri.toString(),
            ),
    );
  }

  factory GithubHeaders.fromJson(Map<String, dynamic> json) =>
      _$GithubHeadersFromJson(json);
}

/* Link: <https://api.github.com/search/repositories?q=flutter&page=2>; rel="next",
 <https://api.github.com/search/repositories?q=flutter&page=34>; rel="last"
*/

@freezed
class PaginationLink with _$PaginationLink {
  const PaginationLink._();
  const factory PaginationLink({
    required int maxPage,
  }) = _PaginationLink;

  factory PaginationLink.parse(
    List<String> value, {
    required String requestUrl,
  }) {
    return PaginationLink(
      maxPage: _extractPageNumber(
        value.firstWhere(
          (e) => e.contains('rel="last"'),
          orElse: () => requestUrl,
        ),
      ),
    );
  }

  static int _extractPageNumber(String value) {
    final regExp = RegExp(
      r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',
    );
    final uriString = regExp.stringMatch(value);

    return int.parse(Uri.parse(uriString!).queryParameters['page']!);
  }

  factory PaginationLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinkFromJson(json);
}
