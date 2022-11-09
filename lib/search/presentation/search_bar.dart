import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:repo_viewer/search/shared/providers.dart';

class SearchBar extends ConsumerStatefulWidget {
  final Widget body;
  final String title;
  final String hint;
  final void Function(String searchedRepoName) onShouldNavigateToResultsPage;
  final void Function() onSignOutButtonPressed;

  const SearchBar({
    required this.body,
    required this.title,
    required this.hint,
    required this.onShouldNavigateToResultsPage,
    required this.onSignOutButtonPressed,
  });

  @override
  ConsumerState<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<SearchBar> {
  late FloatingSearchBarController _controller;

  @override
  void initState() {
    super.initState();

    _controller = FloatingSearchBarController();

    Future.microtask(
      () => ref.read(searchHistoryNotifierProvider.notifier).watchSearchTerms(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void pushPageAndPutFirstInHistory(String searchTerm) {
      widget.onShouldNavigateToResultsPage(searchTerm);

      ref
          .read(searchHistoryNotifierProvider.notifier)
          .addSearchRecord(searchTerm);

      _controller.close();
    }

    void pushPageAndPutInHistory(String searchTerm) {
      widget.onShouldNavigateToResultsPage(searchTerm);

      ref
          .read(searchHistoryNotifierProvider.notifier)
          .addSearchRecord(searchTerm);

      _controller.close();
    }

    return FloatingSearchBar(
      controller: _controller,
      automaticallyImplyBackButton: false,
      leadingActions: [
        if (AutoRouter.of(context).canPop() &&
            (Platform.isIOS || Platform.isMacOS))
          IconButton(
            splashRadius: 18,
            onPressed: () {
              AutoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          )
        else if (AutoRouter.of(context).canPop())
          IconButton(
            splashRadius: 18,
            onPressed: () {
              AutoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          )
      ],
      actions: [
        FloatingSearchBarAction.searchToClear(showIfClosed: false),
        FloatingSearchBarAction(
          child: IconButton(
            splashRadius: 18,
            onPressed: () {
              widget.onSignOutButtonPressed();
            },
            icon: const Icon(MdiIcons.logoutVariant),
          ),
        ),
      ],
      onQueryChanged: (query) {
        ref
            .read(searchHistoryNotifierProvider.notifier)
            .watchSearchTerms(filter: query);
      },
      onSubmitted: (query) {
        pushPageAndPutInHistory(query);
      },
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            'Tap to search 👆',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
      hint: widget.hint,
      body: FloatingSearchBarScrollNotifier(child: widget.body),
      builder: (context, transition) {
        return Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.hardEdge,
          color: Theme.of(context).cardTheme.color,
          child: Consumer(
            builder: (context, ref, child) {
              final searchHistoryState =
                  ref.watch(searchHistoryNotifierProvider);
              return searchHistoryState.map(
                data: (history) {
                  if (_controller.query.isEmpty && history.value.isEmpty) {
                    return Container(
                      height: 56,
                      alignment: Alignment.center,
                      color: Theme.of(context).cardTheme.color,
                      child: Text(
                        'Your search history is empty',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    );
                  } else if (history.value.isEmpty) {
                    return ListTile(
                      title: Text(_controller.query),
                      leading: const Icon(Icons.search),
                      onTap: () {
                        pushPageAndPutInHistory(_controller.query);
                      },
                    );
                  }

                  return Column(
                    children: history.value.map(
                      (term) {
                        return ListTile(
                          onTap: () {
                            pushPageAndPutFirstInHistory(term);
                          },
                          title: Text(
                            term,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          leading: const Icon(Icons.history),
                          trailing: IconButton(
                            onPressed: () {
                              ref
                                  .read(
                                    searchHistoryNotifierProvider.notifier,
                                  )
                                  .deleteSearchRecord(term);
                            },
                            icon: const Icon(Icons.close),
                          ),
                        );
                      },
                    ).toList(),
                  );
                },
                error: (_) => ListTile(
                  title: Text('Some very unusual error ocurred: ${_.error}'),
                ),
                loading: (_) => const ListTile(
                  title: LinearProgressIndicator(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
