import 'package:exam_app/core/routes_manager.dart';
import 'package:exam_app/core/strings_manager.dart';
import 'package:exam_app/domain/model/forget_password_request.dart';
import 'package:exam_app/domain/model/verify_requset.dart';
import 'package:exam_app/presentation/viewmodel/states/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/app_style.dart';
import '../../../core/colors_manager.dart';
import '../../viewmodel/cubits/forget_password_cubit.dart';
import '../../viewmodel/intents/forget_password_intent.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key, required this.email});

  final String email;

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final formKey = GlobalKey<FormState>();
  final verificationController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password'),
      ),
      body: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          switch (state) {
            case ForgetPasswordLoadingState():
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.blueButton,
                    ),
                  ),
                ),
              );
            case VerificationLoadingState():
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.blueButton,
                    ),
                  ),
                ),
              );
            case ForgetPasswordSuccessState():
              Navigator.pop(context);
              verificationController.clear();
              setState(() {});
            case VerificationSuccessState():
              Navigator.pop(context);
              Navigator.pushReplacementNamed(
                  context, RoutesManager.resetPassword,
                  arguments: widget.email);
            case ForgetPasswordErrorState():
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Error",
                    style: AppStyle.snackBarMessage,
                  ),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 2),
                ),
              );
            case VerificationErrorState():
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Error",
                    style: AppStyle.snackBarMessage,
                  ),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 2),
                ),
              );
          }
        },
        child: _buildEmailVerificationFrom(),
      ),
    );
  }

  Widget _buildEmailVerificationFrom() => Padding(
        padding: REdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  StringsManager.emailVerificationTitle,
                  style: AppStyle.forgetPasswordTitle,
                ),
                SizedBox(height: 15.h),
                Text(
                  textAlign: TextAlign.center,
                  StringsManager.emailVerificationSubTitle,
                  style: AppStyle.forgetPasswordSubtitle,
                ),
                SizedBox(height: 30.h),
                PinCodeTextField(
                  controller: verificationController,
                  length: 6,
                  appContext: context,
                  animationType: AnimationType.scale,
                  enableActiveFill: true,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8.r),
                    activeFillColor: Color(0xFFDFE6F7),
                    selectedFillColor: Color(0xFFDFE7F7),
                    inactiveFillColor: Color(0xFFDFE7F7),
                    inactiveColor: Colors.transparent,
                    selectedColor: Colors.transparent,
                    activeColor: Colors.transparent,
                    borderWidth: 0,
                  ),
                  onCompleted: (value) {
                    if (value.isEmpty || value.length < 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please enter the 6-digit code."),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    BlocProvider.of<ForgetPasswordCubit>(context).doIntent(
                      onVerificationIntent(
                        request: VerifyRequset(
                            resetCode: verificationController.text),
                      ),
                    );
                  },
                ),
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didn\'t receive code?',
                      style: AppStyle.underButtonTitle,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<ForgetPasswordCubit>(context).doIntent(
                          onForgetPasswordClickIntent(
                            request: ForgetPasswordRequest(
                              email: widget.email,
                            ),
                          ),
                        );
                      },
                      child: Text('Resend',
                          style: AppStyle.underButtonTitle.copyWith(
                              color: ColorsManager.blueButton,
                              decoration: TextDecoration.underline)),
                    )
                  ],
                ),
              ]),
        ),
      );
}
