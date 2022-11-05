import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/core/domain/fresh.dart';
import 'package:repo_viewer/github/core/domain/github_failures.dart';
import 'package:repo_viewer/github/core/domain/github_repo.dart';
import 'package:repo_viewer/github/core/infrastructure/pagination_config.dart';

part 'paginated_repo_notifier.freezed.dart';

typedef PageGetter = Future<Either<GithubFailures, Fresh<List<GithubRepo>>>>
    Function(int page);

@freezed
class PaginatedRepoState with _$PaginatedRepoState {
  const PaginatedRepoState._();
  const factory PaginatedRepoState.initial(
    Fresh<List<GithubRepo>> repos,
  ) = _Initial;

  const factory PaginatedRepoState.loadingInProgress(
    Fresh<List<GithubRepo>> repos,
    int itemsPerPage,
  ) = _LoadingInProgress;

  const factory PaginatedRepoState.loadSuccess(
    Fresh<List<GithubRepo>> repos, {
    required bool isNextPageAvailable,
  }) = _LoadSuccess;

  const factory PaginatedRepoState.loadFailure(
    Fresh<List<GithubRepo>> repos,
    GithubFailures failures,
  ) = _LoadFailure;
}

class PaginatedRepoNotifier extends StateNotifier<PaginatedRepoState> {
  PaginatedRepoNotifier() : super(PaginatedRepoState.initial(Fresh.yes([])));

  int _page = 1;

  @protected 
  void clearState() {
    _page = 1;
    state = PaginatedRepoState.initial(Fresh.yes([]));
  }

  @protected
  Future<void> getNextPage(PageGetter getter) async {
    state = PaginatedRepoState.loadingInProgress(
      state.repos,
      PaginationConfig.itemsPerPage,
    );

    final failureOrPage = await getter(_page);

    state = failureOrPage.fold(
      (l) => PaginatedRepoState.loadFailure(state.repos, l),
      (r) {
        _page++;

        return PaginatedRepoState.loadSuccess(
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
