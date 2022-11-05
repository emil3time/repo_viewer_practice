import 'package:dartz/dartz.dart';
import 'package:repo_viewer/core/domain/fresh.dart';
import 'package:repo_viewer/core/infrastructure/network_exceptions.dart';
import 'package:repo_viewer/github/core/domain/github_failures.dart';
import 'package:repo_viewer/github/core/domain/github_repo.dart';
import 'package:repo_viewer/github/repos/core/infrastructure/extensions.dart';
import 'package:repo_viewer/github/repos/starred_repos/infrastructure/starred_repo_local_service.dart';
import 'package:repo_viewer/github/repos/starred_repos/infrastructure/starred_repo_remote_service.dart';

class StarredRepoRepository {
  final StarredRepoRemoteService _remoteServices;
  final StarredRepoLocalService _localService;

  StarredRepoRepository(this._remoteServices, this._localService);

  Future<Either<GithubFailures, Fresh<List<GithubRepo>>>> getStarredRepoPage(
    int page,
  ) async {
    try {
      final remotePageItems = await _remoteServices.getStarredRepoPage(page);

      return right(
        await remotePageItems.when(
          noConnection: () async {
            return Fresh.no(
              //get data from local service
              await _localService.getPage(page).then((_) => _.toDomain()),
              isNextPageAvailable:
                  page < await _localService.numberOfLocalSavedPages(),
            );
          },
          noChanges: (maxPage) async {
            return Fresh.yes(
              //get data from local service
              await _localService.getPage(page).then((_) => _.toDomain()),
              isNextPageAvailable: page < maxPage,
            );
          },
          witchNewData: (data, maxPage) async {
            // save data in the local service
            await _localService.upsertPage(data, page);

            return Fresh.yes(
              data.toDomain(),
            );
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(GithubFailures.api(e.errorCode));
    }
  }
}
