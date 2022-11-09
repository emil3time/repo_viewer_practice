import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repo_viewer/auth/shared/providers.dart';
import 'package:repo_viewer/core/presentation/routes/app_routes.gr.dart';
import 'package:repo_viewer/github/core/shared/providers.dart';
import 'package:repo_viewer/github/repos/core/presentation/paginated_repos_list_view.dart';
import 'package:repo_viewer/search/presentation/search_bar.dart';

class SearchedReposPage extends ConsumerStatefulWidget {
  final String searchedRepoName;

  const SearchedReposPage({
    required this.searchedRepoName,
    super.key,
  });

  @override
  ConsumerState<SearchedReposPage> createState() => _SearchedReposPageState();
}

class _SearchedReposPageState extends ConsumerState<SearchedReposPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => ref
          .read(searchedRepoNotifierProvider.notifier)
          .getFirstSearchedRepoPage(widget.searchedRepoName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchBar(
        title: widget.searchedRepoName,
        hint: 'Search all repositories...',
        onShouldNavigateToResultsPage: (searchedRepoName) {
          /*    AutoRouter.of(context)
              .pop();

          AutoRouter.of(context)
              .push(SearchedReposRoute(searchedRepoName: searchedRepoName));
 */
          AutoRouter.of(context).pushAndPopUntil(
            SearchedReposRoute(searchedRepoName: searchedRepoName),
            predicate: (route) => route.settings.name == StarredReposRoute.name,
          );
        },
        onSignOutButtonPressed: () {
          ref.read(authNotifierProvider.notifier).signOut();
        },
        body: PaginatedReposListView(
          message:
              'This is everything we found in your searched terms right now',
          getNextPage: (ref) => ref
              .read(searchedRepoNotifierProvider.notifier)
              .getNextSearchedRepoPage(widget.searchedRepoName),
          paginatedRepoNotifierProvider: searchedRepoNotifierProvider,
        ),
      ),
    );
  }
}
