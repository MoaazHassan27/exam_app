import 'package:exam_app/core/di.dart';
import 'package:exam_app/core/routes_manager.dart';
import 'package:exam_app/presentation/viewmodel/cubits/get_all_subjects_cubit.dart';
import 'package:exam_app/presentation/viewmodel/states/get_all_subjects_state.dart';
import 'package:exam_app/presentation/widgets/subject_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../viewmodel/intents/get_all_subjects_intent.dart';

class ListOfSubject extends StatefulWidget {
  const ListOfSubject({super.key});

  @override
  State<ListOfSubject> createState() => _ListOfSubjectState();
}

class _ListOfSubjectState extends State<ListOfSubject> {
  GetAllSubjectsCubit getAllSubjectsCubit = getIt();

  @override
  void initState() {
    // TODO: implement initState
    getAllSubjectsCubit.doIntent(LoadAllSubjectsIntent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllSubjectsCubit, GetAllSubjectsState>(
      bloc: getAllSubjectsCubit,
      builder: (context, state) {
        switch (state) {
          case GetAllSubjectsInitialState():
            return SizedBox();
          case GetAllSubjectsLoadingState():
            return SizedBox(
              height: 187.h,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case GetAllSubjectsSuccessState():
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesManager.exams,
                          arguments: state.data![index]);
                    },
                    child: SubjectItem(item: state.data![index])),
                itemCount: state.data?.length,
                scrollDirection: Axis.vertical,
              ),
            );
          case GetAllSubjectsErrorState():
            return Text('error');
        }
      },
    );
  }
}
