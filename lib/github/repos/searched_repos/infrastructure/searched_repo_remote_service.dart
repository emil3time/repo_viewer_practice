import 'package:repo_viewer/core/infrastructure/remote_response.dart';
import 'package:repo_viewer/github/core/infrastructure/github_repo_dto.dart';
import 'package:repo_viewer/github/core/infrastructure/pagination_config.dart';
import 'package:repo_viewer/github/repos/core/infrastructure/repo_remote_service.dart';

class SearchedRepoRemoteService extends RepoRemoteService {
  SearchedRepoRemoteService(
    super.dio,
    super.headersCache,
  );

  Future<RemoteResponse<List<GithubRepoDTO>>> getSearchedRepoPage(
    int page,
    String query,
  ) async =>
      super.getPage(
        requestUrl: Uri.https(
          'api.github.com',
          '/search/repositories',
          {
            'q': query,
            'page': page.toString(),
            'per_page': PaginationConfig.itemsPerPage.toString(),
          },
        ),

        // ignore: avoid_dynamic_calls
        jsonDataSelector: (json) => json['items'] as List<dynamic>,
      );
}
