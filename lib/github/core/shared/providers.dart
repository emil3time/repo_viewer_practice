import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/core/shared/providers.dart';
import 'package:repo_viewer/github/core/infrastructure/github_headers_cache.dart';
import 'package:repo_viewer/github/repos/starred_repos/application/starred_repo_notifier.dart';
import 'package:repo_viewer/github/repos/starred_repos/infrastructure/starred_repo_local_service.dart';
import 'package:repo_viewer/github/repos/starred_repos/infrastructure/starred_repo_remote_service.dart';
import 'package:repo_viewer/github/repos/starred_repos/infrastructure/starred_repo_repository.dart';

final starredRepoLocalServiceProvider =
    Provider((ref) => StarredRepoLocalService(ref.watch(sembastProvider)));

final githubHeadersCacheProvider =
    Provider((ref) => GithubHeadersCache(ref.watch(sembastProvider)));

final starredRepoRemoteServiceProvider = Provider(
  (ref) => StarredRepoRemoteService(
    ref.watch(dioProvider),
    ref.watch(githubHeadersCacheProvider),
  ),
);

final starredRepoRepository = Provider(
  (ref) => StarredRepoRepository(
    ref.watch(starredRepoRemoteServiceProvider),
    ref.watch(starredRepoLocalServiceProvider),
  ),
);

final starredRepoNotifierProvider =
    StateNotifierProvider<StarredRepoNotifier, StarredRepoState>(
  (ref) => StarredRepoNotifier(ref.watch(starredRepoRepository)),
);
