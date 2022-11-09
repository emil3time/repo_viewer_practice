import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_viewer/github/details/domain/github_repo_detail.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/timestamp.dart';

part 'github_repo_detail_dto.freezed.dart';
part 'github_repo_detail_dto.g.dart';

@freezed
class GithubRepoDetailDTO with _$GithubRepoDetailDTO {
  const GithubRepoDetailDTO._();
  const factory GithubRepoDetailDTO({
    required String fullName,
    required String html,
    required bool isStarred,
  }) = _GithubRepoDetailDTO;

  factory GithubRepoDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$GithubRepoDetailDTOFromJson(json);

  GithubRepoDetail toDomain() {
    return GithubRepoDetail(
      fullName: fullName,
      html: html,
      isStarred: isStarred,
    );
  }

  Map<String, dynamic> toSembast() {
    final json = toJson();
    json.remove('fullName');
    json['lastViewed'] = Timestamp.now();
    return json;
  }

  factory GithubRepoDetailDTO.fromSembast(
    RecordSnapshot<String, Map<String, dynamic>> recordSnapshot,
  ) {
    /// in dart Map's are immutable
    final copiedMap = Map<String, dynamic>.from(recordSnapshot.value);
    copiedMap['fullName'] = recordSnapshot.key;

    return GithubRepoDetailDTO.fromJson(copiedMap);
  }
}
