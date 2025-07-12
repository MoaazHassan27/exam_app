import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/api/data_source_contract/get_exams_data_source.dart';
import 'package:exam_app/data/models/exams_response.dart';
import 'package:exam_app/domain/repository_contract/get_exams_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetExamsRepository)
class GetExamsRepositoryImpl implements GetExamsRepository {
  GetExamsDataSource getExamsDataSource;

  GetExamsRepositoryImpl(this.getExamsDataSource);

  @override
  Future<Result<ExamsResponse>> getExams(String id) {
    return getExamsDataSource.getExams(id);
  }
}
