import 'package:exam_app/data/models/exams_response.dart';

import '../../../core/result.dart';

abstract interface class GetExamsDataSource {
  Future<Result<ExamsResponse>> getExams(String id);
}
