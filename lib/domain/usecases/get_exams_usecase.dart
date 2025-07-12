import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/models/exams_response.dart';
import 'package:exam_app/domain/repository_contract/get_exams_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetExamsUsecase {
  GetExamsRepository getExamsRepository;

  @factoryMethod
  GetExamsUsecase(this.getExamsRepository);

  Future<Result<ExamsResponse>> execute(String id) {
    return getExamsRepository.getExams(id);
  }
}
