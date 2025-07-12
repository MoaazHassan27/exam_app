class ResetPasswordRequest {
  String? email;
  String? newPassword;

  ResetPasswordRequest({
    this.email,
    this.newPassword,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['newPassword'] = newPassword;
    return map;
  }
}
