import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/models/forget_password_response.dart';
import 'package:exam_app/domain/model/forget_password_request.dart';
import 'package:exam_app/domain/repository_contract/forget_password_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetForgetPasswordUsecase {
  ForgetPasswordRepository forgetPasswordRepository;

  @factoryMethod
  GetForgetPasswordUsecase(this.forgetPasswordRepository);

  Future<Result<ForgetPasswordResponse>> execute(
      ForgetPasswordRequest request) {
    return forgetPasswordRepository.forgetPassword(request);
  }
}
