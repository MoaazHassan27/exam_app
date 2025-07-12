import 'package:injectable/injectable.dart';

import '../../core/dio_servies.dart';
import '../../core/result.dart';
import '../../domain/model/login_request.dart';
import '../api/api_client.dart';
import '../api/data_source_contract/log_in_data_source.dart';
import '../models/login_response.dart';

@Injectable(as: LogInDataSource)
class LogInDataSourceImpl implements LogInDataSource {
  ApiClient apiClient;

  @factoryMethod
  LogInDataSourceImpl({required this.apiClient});

  @override
  Future<Result<LoginResponse>> logIn(LoginRequest request) async {
    try {
      var res = await apiClient.login(request);
      DioServiceExtension.updateDioWithToken(res.token ?? '');
      return Success(data: res);
    } catch (error) {
      return Error(exception: error);
    }
  }
}
