import 'package:dartz/dartz.dart';
import 'package:repo_viewer/core/domain/fresh.dart';
import 'package:repo_viewer/core/infrastructure/network_exceptions.dart';
import 'package:repo_viewer/github/core/domain/github_failures.dart';
import 'package:repo_viewer/github/core/domain/github_repo.dart';
import 'package:repo_viewer/github/repos/core/infrastructure/extensions.dart';
import 'package:repo_viewer/github/repos/searched_repos/infrastructure/searched_repo_remote_service.dart';

class SearchedRepoRepository {
  final SearchedRepoRemoteService _remoteService;

  SearchedRepoRepository(this._remoteService);

  Future<Either<GithubFailures, Fresh<List<GithubRepo>>>> getSearchedRepoPage(
    int page,
    String query,
  ) async {
    try {
      final remotePageItem =
          await _remoteService.getSearchedRepoPage(page, query);

      return right(
        remotePageItem.maybeWhen(
          orElse: () => Fresh.no([], isNextPageAvailable: false),
          noConnection: () => Fresh.no([], isNextPageAvailable: false),
          witchNewData: (data, maxPage) => Fresh.yes(
            // data.map((e) => e.toDomain()).toList(), now from extension to toDomain
            data.toDomain(),
            isNextPageAvailable: maxPage > page,
          ),
        ),
      );
    } on RestApiException catch (e) {
      return left(GithubFailures.api(e.errorCode));
    }
  }
}
