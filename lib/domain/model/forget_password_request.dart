class ForgetPasswordRequest {
  String? email;

  ForgetPasswordRequest({
    this.email,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    return map;
  }
}
