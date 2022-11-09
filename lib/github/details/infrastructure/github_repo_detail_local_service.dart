import 'package:repo_viewer/core/infrastructure/sembast_database.dart';
import 'package:repo_viewer/github/core/infrastructure/github_headers_cache.dart';
import 'package:repo_viewer/github/details/infrastructure/github_repo_detail_dto.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/timestamp.dart';

class GithubRepoDetailLocalService {
  final SembastDatabase _sembastDatabase;
  final GithubHeadersCache _headersCache;

  final _store = stringMapStoreFactory.store('fullName');
  static const cachedRecordsMaxLength = 50;

  GithubRepoDetailLocalService(
    this._sembastDatabase,
    this._headersCache,
  );

  Future<void> upsertRepoDetail(GithubRepoDetailDTO githubRepoDetailDTO) async {
    await _store
        .record(githubRepoDetailDTO.fullName)
        .put(_sembastDatabase.instance, githubRepoDetailDTO.toSembast());

    final keys = await _store.findKeys(
      _sembastDatabase.instance,
      finder: Finder(
        sortOrders: [SortOrder('lastViewed', false)],
      ),
    );

    if (keys.length > cachedRecordsMaxLength) {
      final keysToDelete = keys.sublist(cachedRecordsMaxLength);

      for (final key in keysToDelete) {
        await _store.record(key).delete(_sembastDatabase.instance);

        await _headersCache.delete(
          Uri.https(
            'api.github.com',
            '/repos/$key/readme',
          ),
        );
      }
    }
  }

  Future<GithubRepoDetailDTO?> getRepoDetail(String fullName) async {
    final storeReference = _store.record(fullName);

    await storeReference
        .update(_sembastDatabase.instance, {'lastViewed': Timestamp.now()});

    final recordSnapshot =
        await storeReference.getSnapshot(_sembastDatabase.instance);

    if (recordSnapshot == null) return null;

    return GithubRepoDetailDTO.fromSembast(recordSnapshot);
  }
}
