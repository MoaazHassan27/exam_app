import 'package:exam_app/core/di.dart';
import 'package:flutter/material.dart';

import 'core/dio_servies.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}
