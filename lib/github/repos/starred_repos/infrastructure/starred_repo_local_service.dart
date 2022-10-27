// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:repo_viewer/core/infrastructure/sembast_database.dart';
import 'package:repo_viewer/github/core/infrastructure/github_repo_dto.dart';
import 'package:repo_viewer/github/core/infrastructure/pagination_config.dart';
import 'package:sembast/sembast.dart';

class StarredRepoLocalService {
  final SembastDatabase _sembastDatabase;
  final _store = intMapStoreFactory.store('starred_repo');

  StarredRepoLocalService(this._sembastDatabase);

  Future<void> upsertPage(List<GithubRepoDTO> dtos, int page) async {
    final int sembastPage = page - 1;

    await _store
        .records(
          dtos.mapIndexed(
            (index, _) => index + sembastPage * PaginationConfig.itemsPerPage,
          ),
        )
        .put(
          _sembastDatabase.instance,
          dtos.map((e) => e.toJson()).toList(),
        );
  }

  Future<List<GithubRepoDTO>> getPage(int page) async {
    final int sembastPage = page - 1;

    final records = await _store.find(
      _sembastDatabase.instance,
      finder: Finder(
        limit: PaginationConfig.itemsPerPage,
        offset: PaginationConfig.itemsPerPage * sembastPage,
      ),
    );

    return records.map((e) => GithubRepoDTO.fromJson(e.value)).toList();
  }

  Future<int> numberOfLocalSavedPages() async {
    final allRecords = await _store.count(_sembastDatabase.instance);

    final numberOfPages = (allRecords / PaginationConfig.itemsPerPage).ceil();

    return numberOfPages;
  }
}
