import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_viewer/github/core/domain/user.dart';

part 'github_repo.freezed.dart';

@freezed
class GithubRepo with _$GithubRepo {
  const GithubRepo._();
  const factory GithubRepo({
    required User owner,
    required String name,
    required int stargazersCount,
    required String description,
  }) = _StarredRepo;

  String get fullName => '${owner.name}/$name';

  int get descriptionLength => description.length;
}
