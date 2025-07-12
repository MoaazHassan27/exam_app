import 'package:exam_app/data/models/exams_response.dart';
import 'package:exam_app/data/models/subject_response.dart';

sealed class GetExamsIntent {}

class onSubjectClickIntent extends GetExamsIntent {
  String id;
  onSubjectClickIntent({required this.id});
}
