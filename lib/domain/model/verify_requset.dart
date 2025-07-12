class VerifyRequset {
  String? resetCode;

  VerifyRequset({
    this.resetCode,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resetCode'] = resetCode;
    return map;
  }
}
