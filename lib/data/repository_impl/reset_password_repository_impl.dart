import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/api/data_source_contract/reset_password_data_source.dart';
import 'package:exam_app/data/models/reset_password_response.dart';
import 'package:exam_app/domain/model/reset_password_request.dart';
import 'package:exam_app/domain/repository_contract/reset_password_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResetPasswordRepository)
class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  ResetPasswordDataSource resetPasswordDataSource;

  @factoryMethod
  ResetPasswordRepositoryImpl(this.resetPasswordDataSource);

  @override
  Future<Result<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest request) {
    return resetPasswordDataSource.resetPassword(request);
  }
}
