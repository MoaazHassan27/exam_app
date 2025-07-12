import 'package:exam_app/data/models/subject_response.dart';

sealed class GetAllSubjectsState {}

class GetAllSubjectsInitialState extends GetAllSubjectsState {}

class GetAllSubjectsLoadingState extends GetAllSubjectsState {}

class GetAllSubjectsSuccessState extends GetAllSubjectsState {
  List<Subjects>? data;

  GetAllSubjectsSuccessState(this.data);
}

class GetAllSubjectsErrorState extends GetAllSubjectsState {
  Object exception;

  GetAllSubjectsErrorState({required this.exception});
}
