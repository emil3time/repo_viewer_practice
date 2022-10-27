import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/core/domain/fresh.dart';
import 'package:repo_viewer/github/core/domain/github_failures.dart';
import 'package:repo_viewer/github/core/domain/github_repo.dart';
import 'package:repo_viewer/github/core/infrastructure/pagination_config.dart';
import 'package:repo_viewer/github/repos/starred_repos/infrastructure/starred_repo_repository.dart';

part 'starred_repo_notifier.freezed.dart';

@freezed
class StarredRepoState with _$StarredRepoState {
  const StarredRepoState._();
  const factory StarredRepoState.initial(
    Fresh<List<GithubRepo>> repos,
  ) = _Initial;

  const factory StarredRepoState.loadingInProgress(
    Fresh<List<GithubRepo>> repos,
    int itemsPerPage,
  ) = _LoadingInProgress;

  const factory StarredRepoState.loadSuccess(
    Fresh<List<GithubRepo>> repos, {
    required bool isNextPageAvailable,
  }) = _LoadSuccess;

  const factory StarredRepoState.loadFailure(
    Fresh<List<GithubRepo>> repos,
    GithubFailures failures,
  ) = _LoadFailure;
}

class StarredRepoNotifier extends StateNotifier<StarredRepoState> {
  final StarredRepoRepository _repository;

  StarredRepoNotifier(this._repository)
      : super(StarredRepoState.initial(Fresh.yes([])));

   int _page = 1;

  Future<void> getNextRepoPage() async {
    // state = StarredRepoState.loadFailure(
    //   state.repos,
    //   const GithubFailures.api(401),
    // );

    state = StarredRepoState.loadingInProgress(
      state.repos,
      PaginationConfig.itemsPerPage,
    );

    final failureOrSuccess = await _repository.getStarredRepoPage(_page);

    state = failureOrSuccess.fold(
      (l) => StarredRepoState.loadFailure(state.repos, l),
      (r) {
        _page++;

       return StarredRepoState.loadSuccess(
          r.copyWith(
            entity: [
              ...state.repos.entity,
              ...r.entity,
            ],
          ),
          isNextPageAvailable: r.isNextPageAvailable ?? false,
        );
      },
    );
  }
}
