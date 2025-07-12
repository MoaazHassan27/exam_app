import 'package:exam_app/core/app_style.dart';
import 'package:exam_app/core/colors_manager.dart';
import 'package:exam_app/core/di.dart';
import 'package:exam_app/core/routes_manager.dart';
import 'package:exam_app/core/strings_manager.dart';
import 'package:exam_app/domain/model/forget_password_request.dart';
import 'package:exam_app/presentation/viewmodel/cubits/forget_password_cubit.dart';
import 'package:exam_app/presentation/viewmodel/states/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../viewmodel/intents/forget_password_intent.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  bool isLoading = false;
  ForgetPasswordCubit forgetPasswordCubit = getIt.get<ForgetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password'),
      ),
      body: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        bloc: forgetPasswordCubit,
        listener: (context, state) {
          switch (state) {
            case ForgetPasswordStateInitialState():
              break;
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
            case ForgetPasswordSuccessState():
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("OTP sent successfully.",
                      style: AppStyle.snackBarMessage),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
              Navigator.pushReplacementNamed(
                  context, RoutesManager.emailVerification,
                  arguments: emailController.text);
            case ForgetPasswordErrorState():
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
        child: _buildForgetPasswordForm(),
      ),
    );
  }

  Widget _buildForgetPasswordForm() => Padding(
        padding: REdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  StringsManager.forgetPasswordTitle,
                  style: AppStyle.forgetPasswordTitle,
                ),
                SizedBox(height: 15.h),
                Text(
                  textAlign: TextAlign.center,
                  StringsManager.forgetPasswordSubTitle,
                  style: AppStyle.forgetPasswordSubtitle,
                ),
                SizedBox(height: 30.h),
                TextFormField(
                  cursorColor: Colors.black,
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
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
                            forgetPasswordCubit.doIntent(
                              onForgetPasswordClickIntent(
                                request: ForgetPasswordRequest(
                                  email: emailController.text,
                                ),
                              ),
                            );
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
                            borderRadius: BorderRadius.all(
                              Radius.circular(100.r),
                            ),
                          ),
                        ),
                      ),
              ]),
        ),
      );
}
