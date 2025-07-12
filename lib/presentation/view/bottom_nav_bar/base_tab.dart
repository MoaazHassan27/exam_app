import 'package:exam_app/core/assets_manager.dart';
import 'package:exam_app/presentation/view/bottom_nav_bar/explore.dart';
import 'package:exam_app/presentation/view/bottom_nav_bar/profile.dart';
import 'package:exam_app/presentation/view/bottom_nav_bar/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_style.dart';
import '../../../core/strings_manager.dart';

class BaseTab extends StatefulWidget {
  const BaseTab({super.key});

  @override
  State<BaseTab> createState() => _BaseTabState();
}

class _BaseTabState extends State<BaseTab> {
  int selectedIndex = 0;
  String appbarTitle = 'Survey';
  List<Widget> tabs = [
    const Explore(),
    const Result(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            appbarTitle,
            style: AppStyle.appBarTitle,
          ),
        ),
        bottomNavigationBar: buildBottomNavBar(),
        body: tabs[selectedIndex],
      ),
    );
  }

  Widget buildBottomNavBar() => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 30.sp,
              ),
              label: StringsManager.exploreWord),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AssetsManager.resultLogo),
                size: 30.sp,
              ),
              label: StringsManager.resultWord),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AssetsManager.profileLogo),
                size: 30.sp,
              ),
              label: StringsManager.profileWord),
        ],
        currentIndex: selectedIndex,
        onTap: (value) {
          selectedIndex = value;
          if (selectedIndex == 0) {
            appbarTitle = 'Survey';
          } else if (selectedIndex == 1) {
            appbarTitle = 'Results';
          } else
            appbarTitle = 'Profile';
          setState(() {});
        },
      );
}
