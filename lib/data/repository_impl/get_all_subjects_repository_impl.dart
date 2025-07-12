import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/api/data_source_contract/get_all_subjects_data_source.dart';
import 'package:exam_app/data/models/subject_response.dart';
import 'package:exam_app/domain/repository_contract/get_all_subjects_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllSubjectsRepository)
class GetAllSubjectsRepositoryImpl implements GetAllSubjectsRepository {
  @override
  GetAllSubjectsDataSource getAllSubjectsDataSource;

  GetAllSubjectsRepositoryImpl(this.getAllSubjectsDataSource);

  Future<Result<SubjectResponse>> getAllSubjects() {
    return getAllSubjectsDataSource.getAllSubjects();
  }
}
