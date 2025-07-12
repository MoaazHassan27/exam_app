import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/api/api_client.dart';
import 'package:exam_app/data/api/data_source_contract/get_all_subjects_data_source.dart';
import 'package:exam_app/data/models/subject_response.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: GetAllSubjectsDataSource)
class GetAllSubjectsDataSourceImpl implements GetAllSubjectsDataSource {
  ApiClient apiClient;

  GetAllSubjectsDataSourceImpl(this.apiClient);

  @override
  Future<Result<SubjectResponse>> getAllSubjects() async {
    try {
      final res = await apiClient.getAllSubjects();
      return Success(data: res);
    } catch (error) {
      return Error(exception: error);
    }
  }
}
