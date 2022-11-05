import 'package:repo_viewer/github/repos/core/application/paginated_repo_notifier.dart';
import 'package:repo_viewer/github/repos/starred_repos/infrastructure/starred_repo_repository.dart';

class StarredRepoNotifier extends PaginatedRepoNotifier {
  final StarredRepoRepository _repository;

  StarredRepoNotifier(this._repository);

  Future<void> getNextStarredRepoPage() async {
    super.getNextPage(
      (page) => _repository.getStarredRepoPage(page),
    );
  }
}
