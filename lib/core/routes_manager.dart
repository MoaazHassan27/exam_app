import 'package:exam_app/data/models/subject_response.dart';
import 'package:exam_app/presentation/view/bottom_nav_bar/base_tab.dart';
import 'package:exam_app/presentation/view/email_verfication/email_verfication.dart';
import 'package:exam_app/presentation/view/exams/exams_page.dart';
import 'package:exam_app/presentation/view/forget_password/forget_password.dart';
import 'package:exam_app/presentation/view/reset_password/reset_password.dart';
import 'package:exam_app/presentation/viewmodel/cubits/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/view/log_in/log_in.dart';
import '../presentation/viewmodel/cubits/forget_password_cubit.dart';
import 'di.dart'; // adjust if you have a different path

class RoutesManager {
  static const String logIn = '/logIn';
  static const String forgetPassword = '/forgetPassword';
  static const String emailVerification = '/emailVerification';
  static const String resetPassword = '/resetPassword';
  static const String baseTab = '/baseTab';
  static const String exams = '/exams';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case logIn:
        return MaterialPageRoute(
          builder: (context) => const LogIn(),
        );
      case forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPassword(),
        );
      case emailVerification:
        final args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<ForgetPasswordCubit>(),
            child: EmailVerification(email: args),
          ),
        );
      case resetPassword:
        final args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ResetPasswordCubit>(),
            child: ResetPassword(email: args),
          ),
        );
      case baseTab:
        return MaterialPageRoute(
          builder: (context) => const BaseTab(),
        );
      case exams:
        final args = settings.arguments as Subjects;
        return MaterialPageRoute(
          builder: (context) => ExamsPage(item: args),
        );
    }
  }
}
