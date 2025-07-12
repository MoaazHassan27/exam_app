import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/api/api_client.dart';
import 'package:exam_app/data/api/data_source_contract/get_exams_data_source.dart';
import 'package:exam_app/data/models/exams_response.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: GetExamsDataSource)
class GetExamsDataSourceImpl implements GetExamsDataSource {
  ApiClient apiClient;

  GetExamsDataSourceImpl(this.apiClient);

  @override
  Future<Result<ExamsResponse>> getExams(String id) async {
    try {
      var res = await apiClient.getExam(id);
      return Success(data: res);
    } catch (error) {
      return Error(exception: error);
    }
  }
}
