import '../../core/result.dart';
import '../../data/models/login_response.dart';
import '../model/login_request.dart';

abstract interface class LogInRepository {
  Future<Result<LoginResponse>> logIn(LoginRequest request);
}
