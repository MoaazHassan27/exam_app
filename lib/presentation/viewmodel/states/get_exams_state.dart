import 'package:exam_app/data/models/exams_response.dart';

sealed class GetExamsState {}

class GetExamsInitialState extends GetExamsState {}

class GetExamsLoadingState extends GetExamsState {}

class GetExamsSuccessState extends GetExamsState {
  List<Exams>? data;

  GetExamsSuccessState(this.data);
}

class GetExamsErrorState extends GetExamsState {
  Object exception;

  GetExamsErrorState({required this.exception});
}
