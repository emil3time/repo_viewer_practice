import 'package:repo_viewer/core/infrastructure/sembast_database.dart';
import 'package:sembast/sembast.dart';

class SearchHistoryRepository {
  final SembastDatabase _sembastDatabase;

  SearchHistoryRepository(this._sembastDatabase);

  final _store = StoreRef<int, String>('searchedHistory');

  static const historyLimit = 10;

  Stream<List<String>> watchSearchTerms({
    String? filter,
  }) {
    return _store
        .query(
          finder: filter != null && filter.isNotEmpty
              ? Finder(
                  filter: Filter.custom(
                    (record) => (record.value as String).startsWith(filter),
                  ),
                )
              : null,
        )
        .onSnapshots(_sembastDatabase.instance)
        .map((records) => records.reversed.map((e) => e.value).toList());
  }

  Future<void> addSearchRecord(String term) =>
      _addSearchRecord(term, _sembastDatabase.instance);

  Future<void> deleteSearchRecord(String term) =>
      _deleteSearchRecord(term, _sembastDatabase.instance);

  Future<void> putSearchTermFirst(
    String term,
  ) async {
    await _sembastDatabase.instance.transaction((transaction) async {
      await _deleteSearchRecord(term, transaction);
      await _addSearchRecord(term, transaction);
    });
  }

  Future<void> _addSearchRecord(
    String term,
    DatabaseClient dbClient,
  ) async {
    final existingKey = await _store.findKey(
      dbClient,
      finder: Finder(
        filter: Filter.custom((record) => record.value == term),
      ),
    );

    if (existingKey != null) {
      putSearchTermFirst(term);
      return;
    }

    await _store.add(dbClient, term);

    final count = await _store.count(dbClient);

    if (count > historyLimit) {
      await _store.delete(
        dbClient,
        finder: Finder(
          limit: count - historyLimit,
        ),
      );
    }
  }

  Future<void> _deleteSearchRecord(
    String term,
    DatabaseClient dbClient,
  ) async {
    await _store.delete(
      dbClient,
      finder: Finder(
        filter: Filter.custom((record) => record.value == term),
      ),
    );
  }
}
