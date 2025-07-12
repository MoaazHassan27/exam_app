import 'package:exam_app/data/models/login_response.dart';
import 'package:exam_app/domain/model/login_request.dart';

import '../../../core/result.dart';

abstract interface class LogInDataSource {
  Future<Result<LoginResponse>> logIn(LoginRequest request);
}
