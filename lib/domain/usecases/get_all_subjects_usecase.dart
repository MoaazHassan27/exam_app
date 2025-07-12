import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/models/subject_response.dart';
import 'package:exam_app/domain/repository_contract/get_all_subjects_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllSubjectsUsecase {
  GetAllSubjectsRepository getAllSubjectsRepository;

  @factoryMethod
  GetAllSubjectsUsecase(this.getAllSubjectsRepository);

  Future<Result<SubjectResponse>> execute() {
    return getAllSubjectsRepository.getAllSubjects();
  }
}
