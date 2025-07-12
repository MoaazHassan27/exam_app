import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/api/api_client.dart';
import 'package:exam_app/data/api/data_source_contract/forget_password_data_source.dart';
import 'package:exam_app/data/models/forget_password_response.dart';
import 'package:exam_app/domain/model/forget_password_request.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ForgetPasswordDataSource)
class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSource {
  ApiClient apiClient;

  @factoryMethod
  ForgetPasswordDataSourceImpl(this.apiClient);

  @override
  Future<Result<ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordRequest request) async {
    try {
      var res = await apiClient.forgetPassword(request);
      return Success(data: res);
    } catch (error) {
      return Error(exception: error);
    }
  }
}
