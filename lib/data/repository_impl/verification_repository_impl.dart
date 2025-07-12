import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/api/data_source_contract/verification_data_source.dart';
import 'package:exam_app/data/models/verify_email.dart';
import 'package:exam_app/domain/model/verify_requset.dart';
import 'package:exam_app/domain/repository_contract/verification_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VerificationRepository)
class VreificationRepositoryImpl implements VerificationRepository {
  VerificationDataSource verificationDataSource;

  @factoryMethod
  VreificationRepositoryImpl(this.verificationDataSource);

  @override
  Future<Result<VerifyEmail>> verify(VerifyRequset request) {
    return verificationDataSource.verify(request);
  }
}
