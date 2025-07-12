import 'package:exam_app/core/app_style.dart';
import 'package:exam_app/core/colors_manager.dart';
import 'package:exam_app/core/routes_manager.dart';
import 'package:exam_app/core/strings_manager.dart';
import 'package:exam_app/domain/model/login_request.dart';
import 'package:exam_app/presentation/viewmodel/cubits/log_in_cubit.dart';
import 'package:exam_app/presentation/viewmodel/intents/log_in_intent.dart';
import 'package:exam_app/presentation/viewmodel/states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/di.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  bool isChecked = false;
  LogInCubit logInCubit = getIt.get<LogInCubit>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringsManager.logInWord),
        ),
        body: BlocListener<LogInCubit, LoginState>(
          bloc: logInCubit,
          listener: (context, state) {
            switch (state) {
              case LoginStateInitialState():
                break;
              case LoginStateLoadingState():
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              case LoginStateSuccessState():
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("LogIn Successfully",
                        style: AppStyle.snackBarMessage),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                  ),
                );
                Navigator.pushReplacementNamed(context, RoutesManager.baseTab);
              case LoginStateErrorState():
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
          child: _buildLoginForm(),
        ),
      ),
    );
  }

  Widget _buildLoginForm() => Padding(
        padding: REdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
            SizedBox(height: 24.h),
            TextFormField(
              cursorColor: Colors.black,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
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
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                SizedBox(width: 4.w),
                Text('Remember Me'),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, RoutesManager.forgetPassword);
                  },
                  child: Text(
                    'Forget password?',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        logInCubit.doIntent(
                          onLogInClick(
                            request: LoginRequest(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Login',
                      style: AppStyle.blueButton,
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.blueButton,
                        minimumSize: const Size(340, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.r)))),
                  ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: AppStyle.underButtonTitle
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 4.w,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Sign Up',
                    style: AppStyle.signUpWord,
                  ),
                )
              ],
            ),
          ]),
        ),
      );
}
