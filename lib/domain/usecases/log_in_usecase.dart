import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/models/login_response.dart';
import 'package:exam_app/domain/model/login_request.dart';
import 'package:exam_app/domain/repository_contract/log_in_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLogInUsecase {
  LogInRepository logInRepository;
@factoryMethod
  GetLogInUsecase(this.logInRepository);

  Future<Result<LoginResponse>> execute(LoginRequest request) {
    return logInRepository.logIn(request);
  }
}
