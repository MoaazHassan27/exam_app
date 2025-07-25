import 'package:exam_app/config/themes/my_theme.dart';
import 'package:exam_app/core/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        onGenerateRoute: RoutesManager.router,
        initialRoute: RoutesManager.logIn,
        theme: MyTheme.light,
      ),
    );
  }
}
