import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/api/api_client.dart';
import 'package:exam_app/data/api/data_source_contract/verification_data_source.dart';
import 'package:exam_app/data/models/verify_email.dart';
import 'package:exam_app/domain/model/verify_requset.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VerificationDataSource)
class VreificationDataSourceImpl implements VerificationDataSource {
  ApiClient apiClient;

  @factoryMethod
  VreificationDataSourceImpl(this.apiClient);

  @override
  Future<Result<VerifyEmail>> verify(VerifyRequset request) async {
    try {
      var res = await apiClient.verificationCode(request);
      return Success(data: res);
    } catch (error) {
      return Error(exception: error);
    }
  }
}
