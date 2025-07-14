import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_style.dart';
import '../../../core/assets_manager.dart';
import '../../../core/colors_manager.dart';
import '../../../data/models/exams_response.dart';

class ExamStartPage extends StatelessWidget {
  const ExamStartPage({super.key, required this.item});

  final Exams item;

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Image.asset(
                AssetsManager.examProfitLogo,
              ),
              SizedBox(width: 5.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.title ?? '',
                    style: AppStyle.forgetPasswordTitle,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    item.numberOfQuestions != null
                        ? '${item.numberOfQuestions} Question'
                        : '0 Questions',
                    style: AppStyle.searchText,
                  ),
                ],
              ),
              Spacer(),
              Text(
                item.duration != null ? '${item.duration} Minutes' : '0 min',
                style: AppStyle.searchText
                    .copyWith(color: ColorsManager.blueButton),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Start',
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
        ],
      ),
    );
  }
}
