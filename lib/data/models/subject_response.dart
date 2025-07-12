import 'package:json_annotation/json_annotation.dart';

part 'subject_response.g.dart';

@JsonSerializable()
class SubjectResponse {
  @JsonKey(name: "subjects")
  final List<Subjects>? subjects;

  SubjectResponse({
    this.subjects,
  });

  factory SubjectResponse.fromJson(Map<String, dynamic> json) {
    return _$SubjectResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectResponseToJson(this);
  }
}

@JsonSerializable()
class Subjects {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  Subjects({
    this.Id,
    this.name,
    this.icon,
    this.createdAt,
  });

  factory Subjects.fromJson(Map<String, dynamic> json) {
    return _$SubjectsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectsToJson(this);
  }
}
