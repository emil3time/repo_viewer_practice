import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:repo_viewer/core/presentation/toasts.dart';
import 'package:repo_viewer/github/core/presentation/empty_repo_page.dart';
import 'package:repo_viewer/github/repos/core/application/paginated_repo_notifier.dart';
import 'package:repo_viewer/github/repos/core/presentation/failure_repo_tile.dart';
import 'package:repo_viewer/github/repos/core/presentation/loading_repo_tile.dart';
import 'package:repo_viewer/github/repos/core/presentation/repo_tile.dart';

class PaginatedReposListView extends ConsumerStatefulWidget {
  final String message;

  final AutoDisposeStateNotifierProvider<PaginatedRepoNotifier,
      PaginatedRepoState> paginatedRepoNotifierProvider;

  final void Function(WidgetRef ref) getNextPage;

  const PaginatedReposListView({
    required this.message,
    required this.getNextPage,
    required this.paginatedRepoNotifierProvider,
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
    ref.listen<PaginatedRepoState>(widget.paginatedRepoNotifierProvider,
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

    final state = ref.watch(widget.paginatedRepoNotifierProvider);

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        final metrics = notification.metrics;

        final limit = metrics.maxScrollExtent - metrics.viewportDimension / 3;

        if (canLoadNextPage && metrics.pixels >= limit) {
          canLoadNextPage = false;

          widget.getNextPage(ref);
        }

        return false;
      },
      child: state.maybeWhen(
        loadSuccess: (repos, _) => repos.entity.isEmpty,
        orElse: () => false,
      )
          ? EmptyRepoPage(
              message: widget.message,
            )
          : _PaginatedListView(state: state),
    );
  }
}

class _PaginatedListView extends StatelessWidget {
  final PaginatedRepoState state;

  const _PaginatedListView({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    //  final fsb = context.findAncestorWidgetOfExactType<FloatingSearchBar>()?.height;
    final fsb = FloatingSearchBar.of(context)?.widget;
    return ListView.builder(
      padding: fsb == null
          ? EdgeInsets.zero
          : EdgeInsets.only(
              top: fsb.height + 8 + MediaQuery.of(context).padding.top ,
            ),
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
