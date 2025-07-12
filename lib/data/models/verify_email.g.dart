// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEmail _$VerifyEmailFromJson(Map<String, dynamic> json) => VerifyEmail(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VerifyEmailToJson(VerifyEmail instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
    };
