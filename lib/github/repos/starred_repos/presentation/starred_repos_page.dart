import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/auth/shared/providers.dart';
import 'package:repo_viewer/core/presentation/routes/app_routes.gr.dart';
import 'package:repo_viewer/github/core/shared/providers.dart';
import 'package:repo_viewer/github/repos/core/presentation/paginated_repos_list_view.dart';
import 'package:repo_viewer/search/presentation/search_bar.dart';

class StarredReposPage extends ConsumerStatefulWidget {
  const StarredReposPage({super.key});

  @override
  ConsumerState<StarredReposPage> createState() => _StarredReposPageState();
}

class _StarredReposPageState extends ConsumerState<StarredReposPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => ref
          .read(starredRepoNotifierProvider.notifier)
          .getNextStarredRepoPage(),
    );

    /* WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(starredRepoNotifierProvider.notifier).getNextRepoPage();
    });

    Future.delayed(const Duration(seconds: 1)).then(
      (value) {

        return ref.read(starredRepoNotifierProvider.notifier).getNextRepoPage();
      },
    ); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchBar(
        title: 'Starred repos',
        hint: 'Search all repositories...',
        onShouldNavigateToResultsPage: (searchedRepoName) {
          AutoRouter.of(context)
              .push(SearchedReposRoute(searchedRepoName: searchedRepoName));
        },
        onSignOutButtonPressed: () {
          ref.read(authNotifierProvider.notifier).signOut();
        },
        body: PaginatedReposListView(
          message: 'This is everything we found in your starred repo right now',
          getNextPage: (ref) => ref
              .read(starredRepoNotifierProvider.notifier)
              .getNextStarredRepoPage(),
          paginatedRepoNotifierProvider: starredRepoNotifierProvider,
        ),
      ),
    );
  }
}
