import 'package:exam_app/data/models/subject_response.dart';

import '../../../core/result.dart';

abstract interface class GetAllSubjectsDataSource {
  Future<Result<SubjectResponse>> getAllSubjects();
}
