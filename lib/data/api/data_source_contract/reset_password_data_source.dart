import 'package:exam_app/data/models/reset_password_response.dart';
import 'package:exam_app/domain/model/reset_password_request.dart';

import '../../../core/result.dart';

abstract interface class ResetPasswordDataSource {
  Future<Result<ResetPasswordResponse>> resetPassword(ResetPasswordRequest request);
}
