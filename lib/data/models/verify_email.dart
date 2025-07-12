import 'package:json_annotation/json_annotation.dart';

part 'verify_email.g.dart';

@JsonSerializable()
class VerifyEmail {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "code")
  final int? code;

  VerifyEmail ({
    this.status,
    this.message,
    this.code,
  });

  factory VerifyEmail.fromJson(Map<String, dynamic> json) {
    return _$VerifyEmailFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyEmailToJson(this);
  }
}


