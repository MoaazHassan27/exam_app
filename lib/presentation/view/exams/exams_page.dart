import 'package:exam_app/data/models/subject_response.dart';
import 'package:exam_app/presentation/widgets/list_of_exams.dart';
import 'package:flutter/material.dart';

import '../../../core/app_style.dart';

class ExamsPage extends StatelessWidget {
  const ExamsPage({super.key, required this.item});

  final Subjects item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.name ?? '',
          style: AppStyle.appBarTitle,
        ),
      ),
      body: ListOfExams(id: item.Id ?? ''),
    );
  }
}
