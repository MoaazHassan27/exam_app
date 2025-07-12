import 'package:json_annotation/json_annotation.dart';

part 'exams_response.g.dart';

@JsonSerializable()
class ExamsResponse {
  @JsonKey(name: "exams")
  final List<Exams>? exams;

  ExamsResponse({
    this.exams,
  });

  factory ExamsResponse.fromJson(Map<String, dynamic> json) {
    return _$ExamsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamsResponseToJson(this);
  }
}

@JsonSerializable()
class Exams {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "subject")
  final String? subject;
  @JsonKey(name: "numberOfQuestions")
  final int? numberOfQuestions;
  @JsonKey(name: "active")
  final bool? active;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  Exams({
    this.Id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory Exams.fromJson(Map<String, dynamic> json) {
    return _$ExamsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamsToJson(this);
  }
}
