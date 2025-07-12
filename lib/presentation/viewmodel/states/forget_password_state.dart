class ForgetPasswordState {}

class ForgetPasswordStateInitialState extends ForgetPasswordState {}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordSuccessState extends ForgetPasswordState {}

class ForgetPasswordErrorState extends ForgetPasswordState {
  Object exception;

  ForgetPasswordErrorState({required this.exception});
}

class VerificationInitialState extends ForgetPasswordState {}

class VerificationLoadingState extends ForgetPasswordState {}

class VerificationSuccessState extends ForgetPasswordState {}

class VerificationErrorState extends ForgetPasswordState {
  Object exception;

  VerificationErrorState({required this.exception});
}
