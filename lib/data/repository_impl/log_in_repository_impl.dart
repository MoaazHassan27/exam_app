import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/api/data_source_contract/log_in_data_source.dart';
import 'package:exam_app/data/models/login_response.dart';
import 'package:exam_app/domain/model/login_request.dart';
import 'package:exam_app/domain/repository_contract/log_in_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LogInRepository)
class LogInRepositoryImpl implements LogInRepository {
  LogInDataSource logInDataSource;

  @factoryMethod
  LogInRepositoryImpl(this.logInDataSource);

  @override
  Future<Result<LoginResponse>> logIn(LoginRequest request) {
    return logInDataSource.logIn(request);
  }
}
