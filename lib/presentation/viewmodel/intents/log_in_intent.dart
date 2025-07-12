import 'package:exam_app/domain/model/login_request.dart';

sealed class LogInIntent {}

class onLogInClick extends LogInIntent {
  LoginRequest request;

  onLogInClick({required this.request});
}
