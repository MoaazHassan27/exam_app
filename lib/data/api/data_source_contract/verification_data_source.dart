import 'package:exam_app/data/models/verify_email.dart';
import 'package:exam_app/domain/model/verify_requset.dart';

import '../../../core/result.dart';

abstract interface class VerificationDataSource {
  Future<Result<VerifyEmail>> verify(VerifyRequset request);
}
