import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/models/verify_email.dart';
import 'package:exam_app/domain/model/verify_requset.dart';
import 'package:exam_app/domain/repository_contract/verification_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetVerificationUsecase {
  VerificationRepository verificationRepository;

  @factoryMethod
  GetVerificationUsecase(this.verificationRepository);

  Future<Result<VerifyEmail>> execute(VerifyRequset request) {
    return verificationRepository.verify(request);
  }
}
