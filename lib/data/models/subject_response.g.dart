// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectResponse _$SubjectResponseFromJson(Map<String, dynamic> json) =>
    SubjectResponse(
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => Subjects.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectResponseToJson(SubjectResponse instance) =>
    <String, dynamic>{
      'subjects': instance.subjects,
    };

Subjects _$SubjectsFromJson(Map<String, dynamic> json) => Subjects(
      Id: json['_id'] as String?,
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$SubjectsToJson(Subjects instance) => <String, dynamic>{
      '_id': instance.Id,
      'name': instance.name,
      'icon': instance.icon,
      'createdAt': instance.createdAt,
    };
