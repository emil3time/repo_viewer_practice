import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/core/presentation/toasts.dart';
import 'package:repo_viewer/github/core/presentation/empty_repo_page.dart';
import 'package:repo_viewer/github/core/shared/providers.dart';
import 'package:repo_viewer/github/repos/starred_repos/application/starred_repo_notifier.dart';
import 'package:repo_viewer/github/repos/starred_repos/presentation/failure_repo_tile.dart';
import 'package:repo_viewer/github/repos/starred_repos/presentation/loading_repo_tile.dart';
import 'package:repo_viewer/github/repos/starred_repos/presentation/repo_tile.dart';

class PaginatedReposListView extends ConsumerStatefulWidget {
  const PaginatedReposListView({
    super.key,
  });

  @override
  ConsumerState<PaginatedReposListView> createState() =>
      _PaginatedReposListViewState();
}

class _PaginatedReposListViewState
    extends ConsumerState<PaginatedReposListView> {
  bool canLoadNextPage = false;
  bool hasAlreadyShowNoConnectionToast = false;

  @override
  Widget build(
    BuildContext context,
  ) {
    ref.listen<StarredRepoState>(starredRepoNotifierProvider,
        (previous, state) {
      state.map(
        initial: (_) => canLoadNextPage = true,
        loadingInProgress: (_) => canLoadNextPage = false,
        loadSuccess: (_) {
          if (!_.repos.isFresh && !hasAlreadyShowNoConnectionToast) {
            hasAlreadyShowNoConnectionToast = true;

            showNoConnectionToast(
              context: context,
              message: "You're not online. Some information may be outdated ",
            );
          }
          canLoadNextPage = _.isNextPageAvailable;
        },
        loadFailure: (_) => canLoadNextPage = false,
      );
    });

    final state = ref.watch(starredRepoNotifierProvider);

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        final metrics = notification.metrics;

        final limit = metrics.maxScrollExtent - metrics.viewportDimension / 3;

        if (canLoadNextPage && metrics.pixels >= limit) {
          canLoadNextPage = false;

          ref.read(starredRepoNotifierProvider.notifier).getNextRepoPage();
        }

        return false;
      },
      child: state.maybeWhen(
        loadSuccess: (repos, _) => repos.entity.isEmpty,
        orElse: () => false,
      )
          ? const EmptyRepoPage(
              message: 'This is everything we found there for you',
            )
          : _PaginatedListView(state: state),
    );
  }
}

class _PaginatedListView extends StatelessWidget {
  final StarredRepoState state;

  const _PaginatedListView({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.map(
        initial: (_) => 0,
        loadingInProgress: (_) => _.repos.entity.length + _.itemsPerPage,
        loadSuccess: (_) => _.repos.entity.length,
        loadFailure: (_) => _.repos.entity.length + 1,
      ),
      itemBuilder: (context, index) => state.map(
        initial: (_) => const SizedBox.shrink(),
        loadingInProgress: (_) {
          if (index < _.repos.entity.length) {
            return RepoTile(repo: _.repos.entity[index]);
          } else {
            return const LoadingRepoTile();
          }
        },
        loadSuccess: (_) => RepoTile(repo: _.repos.entity[index]),
        loadFailure: (_) {
          if (index < _.repos.entity.length) {
            return RepoTile(repo: _.repos.entity[index]);
          } else {
            return FailureRepoTile(
              failures: _.failures,
            );
          }
        },
      ),
    );
  }
}
