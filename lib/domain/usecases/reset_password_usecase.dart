import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/models/reset_password_response.dart';
import 'package:exam_app/domain/model/reset_password_request.dart';
import 'package:exam_app/domain/repository_contract/reset_password_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetResetPasswordUsecase {
  ResetPasswordRepository resetPasswordRepository;

  @factoryMethod
  GetResetPasswordUsecase(this.resetPasswordRepository);

  Future<Result<ResetPasswordResponse>> execute(ResetPasswordRequest request) {
    return resetPasswordRepository.resetPassword(request);
  }
}
