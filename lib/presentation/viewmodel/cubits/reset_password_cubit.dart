import 'package:bloc/bloc.dart';
import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/models/reset_password_response.dart';
import 'package:exam_app/domain/model/reset_password_request.dart';
import 'package:exam_app/domain/usecases/reset_password_usecase.dart';
import 'package:injectable/injectable.dart';

import '../states/reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  GetResetPasswordUsecase getResetPasswordUsecase;

  @factoryMethod
  ResetPasswordCubit(this.getResetPasswordUsecase)
      : super(ResetPasswordInitialState());

  void resetPassword(ResetPasswordRequest request) async {
    emit(ResetPasswordLoadingState());
    var res = await getResetPasswordUsecase.execute(request);
    switch (res) {
      case Success<ResetPasswordResponse>():
        emit(ResetPasswordSuccessState());
      case Error<ResetPasswordResponse>():
        emit(ResetPasswordErrorState(exception: res.exception));
    }
  }
}
