import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:repo_viewer/auth/shared/providers.dart';
import 'package:repo_viewer/github/core/shared/providers.dart';
import 'package:repo_viewer/github/repos/starred_repos/presentation/paginated_repos_list_view.dart';

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
      () => ref.read(starredRepoNotifierProvider.notifier).getNextRepoPage(),
    );

    /* WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(starredRepoNotifierProvider.notifier).getNextRepoPage();
    });

    Future.delayed(const Duration(seconds: 1)).then(
      (value) {
        print('dsdsdsdsdsdsdsd');
        return ref.read(starredRepoNotifierProvider.notifier).getNextRepoPage();
      },
    ); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Starred repo'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(authNotifierProvider.notifier).signOut();
            },
            icon: const Icon(
              MdiIcons.logoutVariant,
            ),
          )
        ],
      ),
      body: const SafeArea(
        child: PaginatedReposListView(),
      ),
    );
  }
}
