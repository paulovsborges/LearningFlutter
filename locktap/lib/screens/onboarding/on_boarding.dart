import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locktap/screens/onboarding/page_indicator.dart';
import 'package:locktap/screens/onboarding/screenshots_grid.dart';
import 'package:locktap/util/app_colors.dart';

class OnBoardingScreen extends StatelessWidget with ScreenshotsGrid, PageIndicator {
  const OnBoardingScreen({super.key});

  Widget _buildBottomSheetView() {
    return Container(
      // height: 300,
      color: AppColors.secondaryBackground,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          buildPageIndicator(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.backgroundColor,
          child: buildScreenshotsFrid(
            [
              'assets/images/onboarding/first_step/img_onboarding_1_1.png',
              'assets/images/onboarding/first_step/img_onboarding_1_2.png',
              'assets/images/onboarding/first_step/img_onboarding_1_3.png',
              'assets/images/onboarding/first_step/img_onboarding_1_4.png',
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildBottomSheetView(),
          ],
        ),
      ],
    );
  }
}
