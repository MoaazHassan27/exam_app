import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/api/data_source_contract/forget_password_data_source.dart';
import 'package:exam_app/data/models/forget_password_response.dart';
import 'package:exam_app/domain/model/forget_password_request.dart';
import 'package:exam_app/domain/repository_contract/forget_password_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRepository)
class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  ForgetPasswordDataSource forgetPasswordDataSource;

  @factoryMethod
  ForgetPasswordRepositoryImpl(this.forgetPasswordDataSource);

  @override
  Future<Result<ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordRequest request) {
    return forgetPasswordDataSource.forgetPassword(request);
  }
}
