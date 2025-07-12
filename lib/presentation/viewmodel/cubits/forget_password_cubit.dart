import 'package:bloc/bloc.dart';
import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/models/forget_password_response.dart';
import 'package:exam_app/data/models/verify_email.dart';
import 'package:exam_app/domain/model/forget_password_request.dart';
import 'package:exam_app/domain/model/verify_requset.dart';
import 'package:exam_app/domain/usecases/forget_password_usecase.dart';
import 'package:exam_app/domain/usecases/verification_usecase.dart';
import 'package:injectable/injectable.dart';

import '../intents/forget_password_intent.dart';
import '../states/forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  GetForgetPasswordUsecase getForgetPasswordUsecase;
  GetVerificationUsecase getVerificationUsecase;

  ForgetPasswordCubit(
      this.getForgetPasswordUsecase, this.getVerificationUsecase)
      : super(ForgetPasswordStateInitialState());

  void doIntent(ForgetPasswordIntent intent) {
    switch (intent) {
      case onForgetPasswordClickIntent():
        _forgetPassword(intent.request);
      case onVerificationIntent():
        _verify(intent.request);
    }
  }

  void _forgetPassword(ForgetPasswordRequest request) async {
    emit(ForgetPasswordLoadingState());
    var res = await getForgetPasswordUsecase.execute(request);
    switch (res) {
      case Success<ForgetPasswordResponse>():
        emit(ForgetPasswordSuccessState());
      case Error<ForgetPasswordResponse>():
        emit(ForgetPasswordErrorState(exception: res.exception));
    }
  }

  void _verify(VerifyRequset request) async {
    emit(VerificationLoadingState());
    var res = await getVerificationUsecase.execute(request);
    switch (res) {
      case Success<VerifyEmail>():
        emit(VerificationSuccessState());
      case Error<VerifyEmail>():
        emit(VerificationErrorState(exception: res.exception));
    }
  }
}
