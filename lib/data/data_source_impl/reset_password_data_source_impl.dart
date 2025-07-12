import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/api/api_client.dart';
import 'package:exam_app/data/api/data_source_contract/reset_password_data_source.dart';
import 'package:exam_app/data/models/reset_password_response.dart';
import 'package:exam_app/domain/model/reset_password_request.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResetPasswordDataSource)
class ResetPasswordDataSourceImpl implements ResetPasswordDataSource {
  ApiClient apiClient;

  @factoryMethod
  ResetPasswordDataSourceImpl(this.apiClient);

  @override
  Future<Result<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest request) async {
    try {
      var res = await apiClient.resetPassword(request);
      return Success(data: res);
    } catch (error) {
      return Error(exception: error);
    }
  }
}
