import 'package:exam_app/domain/model/forget_password_request.dart';
import 'package:exam_app/domain/model/verify_requset.dart';

sealed class ForgetPasswordIntent {}

class onForgetPasswordClickIntent extends ForgetPasswordIntent {
  ForgetPasswordRequest request;

  onForgetPasswordClickIntent({required this.request});
}

class onVerificationIntent extends ForgetPasswordIntent {
  VerifyRequset request;

  onVerificationIntent({required this.request});
}
