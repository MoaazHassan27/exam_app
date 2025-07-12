import 'package:exam_app/data/models/subject_response.dart';

import '../../../core/result.dart';

abstract interface class GetAllSubjectsRepository {
  Future<Result<SubjectResponse>> getAllSubjects();
}
