import 'package:bloc/bloc.dart';
import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/models/subject_response.dart';
import 'package:exam_app/domain/usecases/get_all_subjects_usecase.dart';
import 'package:injectable/injectable.dart';

import '../intents/get_all_subjects_intent.dart';
import '../states/get_all_subjects_state.dart';

@injectable
class GetAllSubjectsCubit extends Cubit<GetAllSubjectsState> {
  GetAllSubjectsUsecase getAllSubjectsUsecase;

  GetAllSubjectsCubit(this.getAllSubjectsUsecase)
      : super(GetAllSubjectsInitialState());

  void doIntent(GetAllSubjetcsIntent intent) {
    switch (intent) {
      case LoadAllSubjectsIntent():
        _getAllSubjects();
    }
  }

  void _getAllSubjects() async {
    emit(GetAllSubjectsLoadingState());
    var res = await getAllSubjectsUsecase.execute();
    switch (res) {
      case Success<SubjectResponse>():
        emit(GetAllSubjectsSuccessState(res.data.subjects));
      case Error<SubjectResponse>():
        emit(GetAllSubjectsErrorState(exception: res.exception));
    }
  }
}
