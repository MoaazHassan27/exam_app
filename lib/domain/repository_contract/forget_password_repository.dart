import 'package:exam_app/data/models/forget_password_response.dart';
import 'package:exam_app/domain/model/forget_password_request.dart';

import '../../../core/result.dart';

abstract interface class ForgetPasswordRepository {
  Future<Result<ForgetPasswordResponse>> forgetPassword(ForgetPasswordRequest request);
}
