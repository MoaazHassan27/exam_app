// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exams_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamsResponse _$ExamsResponseFromJson(Map<String, dynamic> json) =>
    ExamsResponse(
      exams: (json['exams'] as List<dynamic>?)
          ?.map((e) => Exams.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExamsResponseToJson(ExamsResponse instance) =>
    <String, dynamic>{
      'exams': instance.exams,
    };

Exams _$ExamsFromJson(Map<String, dynamic> json) => Exams(
      Id: json['_id'] as String?,
      title: json['title'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      subject: json['subject'] as String?,
      numberOfQuestions: (json['numberOfQuestions'] as num?)?.toInt(),
      active: json['active'] as bool?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$ExamsToJson(Exams instance) => <String, dynamic>{
      '_id': instance.Id,
      'title': instance.title,
      'duration': instance.duration,
      'subject': instance.subject,
      'numberOfQuestions': instance.numberOfQuestions,
      'active': instance.active,
      'createdAt': instance.createdAt,
    };
