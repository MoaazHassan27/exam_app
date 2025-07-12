import 'package:exam_app/core/routes_manager.dart';
import 'package:exam_app/core/strings_manager.dart';
import 'package:exam_app/domain/model/reset_password_request.dart';
import 'package:exam_app/presentation/viewmodel/cubits/reset_password_cubit.dart';
import 'package:exam_app/presentation/viewmodel/states/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_style.dart';
import '../../../core/colors_manager.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password'),
      ),
      body: BlocListener<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          switch (state) {
            case ResetPasswordInitialState():
              break;
            case ResetPasswordLoadingState():
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
            case ResetPasswordSuccessState():
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Password Reseted Successfully",
                    style: AppStyle.snackBarMessage,
                  ),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
              Navigator.pushReplacementNamed(context, RoutesManager.logIn);
            case ResetPasswordErrorState():
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Error", style: AppStyle.snackBarMessage),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 2),
                ),
              );
          }
        },
        child: _buildResetPasswordForm(),
      ),
    );
  }

  Widget _buildResetPasswordForm() => Padding(
        padding: REdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  StringsManager.resetPasswordTitle,
                  style: AppStyle.forgetPasswordTitle,
                ),
                SizedBox(height: 15.h),
                Text(
                  textAlign: TextAlign.center,
                  StringsManager.resetPasswordSubTitle,
                  style: AppStyle.forgetPasswordSubtitle,
                ),
                SizedBox(height: 30.h),
                TextFormField(
                  cursorColor: Colors.black,
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'New Password',
                    hintText: 'Enter Your Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25.h),
                TextFormField(
                  cursorColor: Colors.black,
                  controller: passwordConfirmationController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Confirm Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    if (value != passwordController.text) {
                      return 'InCorrect Password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50.h),
                isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<ResetPasswordCubit>(context)
                                .resetPassword(ResetPasswordRequest(
                                    email: widget.email,
                                    newPassword:
                                        passwordConfirmationController.text));
                          }
                        },
                        child: Text(
                          'Continue',
                          style: AppStyle.blueButton,
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsManager.blueButton,
                            minimumSize: const Size(340, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100.r)))),
                      ),
              ]),
        ),
      );
}
