import 'package:repo_viewer/core/infrastructure/remote_response.dart';
import 'package:repo_viewer/github/core/infrastructure/github_repo_dto.dart';
import 'package:repo_viewer/github/core/infrastructure/pagination_config.dart';
import 'package:repo_viewer/github/repos/core/infrastructure/repo_remote_service.dart';

class StarredRepoRemoteService extends RepoRemoteService {
  StarredRepoRemoteService(
    super.dio,
    super.headersCache,
  );

  Future<RemoteResponse<List<GithubRepoDTO>>> getStarredRepoPage(
    int page,
  ) async =>
      super.getPage(
        requestUrl: Uri.https(
          'api.github.com',
          '/user/starred',
          {
            'page': page.toString(),
            'per_page': PaginationConfig.itemsPerPage.toString(),
          },
        ),
        jsonDataSelector: (json) => json as List<dynamic>,
      );
}
