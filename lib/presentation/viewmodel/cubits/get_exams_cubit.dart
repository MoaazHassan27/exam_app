import 'package:bloc/bloc.dart';
import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/models/exams_response.dart';
import 'package:exam_app/domain/usecases/get_exams_usecase.dart';
import 'package:injectable/injectable.dart';

import '../intents/get_exams_intent.dart';
import '../states/get_exams_state.dart';

@injectable
class GetExamsCubit extends Cubit<GetExamsState> {
  GetExamsUsecase getExamsUsecase;

  GetExamsCubit(this.getExamsUsecase) : super(GetExamsInitialState());

  void doIntent(GetExamsIntent intent) {
    switch (intent) {
      case onSubjectClickIntent():
        _getExams(intent.id ?? '');
    }
  }

  void _getExams(String id) async {
    emit(GetExamsLoadingState());
    var res = await getExamsUsecase.execute(id);
    switch (res) {
      case Success<ExamsResponse>():
        emit(GetExamsSuccessState(res.data.exams));
      case Error<ExamsResponse>():
        emit(GetExamsErrorState(exception: res));
    }
  }
}
