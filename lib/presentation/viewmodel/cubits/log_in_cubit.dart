import 'package:bloc/bloc.dart';
import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/models/login_response.dart';
import 'package:exam_app/domain/model/login_request.dart';
import 'package:exam_app/domain/usecases/log_in_usecase.dart';
import 'package:injectable/injectable.dart';

import '../intents/log_in_intent.dart';
import '../states/login_state.dart';

@injectable
class LogInCubit extends Cubit<LoginState> {
  GetLogInUsecase getLogInUsecase;

  LogInCubit(this.getLogInUsecase) : super(LoginStateInitialState());

  void doIntent(LogInIntent intent) {
    switch (intent) {
      case onLogInClick():
        _login(intent.request);
    }
  }

  void _login(LoginRequest request) async {
    emit(LoginStateLoadingState());
    var res = await getLogInUsecase.execute(request);
    switch (res) {
      case Success<LoginResponse>():
        emit(LoginStateSuccessState());
      case Error<LoginResponse>():
        emit(LoginStateErrorState(exception: res.exception));
    }
  }
}
