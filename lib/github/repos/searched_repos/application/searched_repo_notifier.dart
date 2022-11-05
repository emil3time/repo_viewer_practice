import 'package:repo_viewer/github/repos/core/application/paginated_repo_notifier.dart';
import 'package:repo_viewer/github/repos/searched_repos/infrastructure/searched_repo_repository.dart';

class SearchedRepoNotifier extends PaginatedRepoNotifier {
  final SearchedRepoRepository _repository;

  SearchedRepoNotifier(this._repository);

  Future<void> getFirstSearchedRepoPage(String query) async {
    super.clearState();
    await getNextSearchedRepoPage(query);
  }

  Future<void> getNextSearchedRepoPage(String query) async {
    super.getNextPage(
      (page) => _repository.getSearchedRepoPage(page, query),
    );
  }
}
