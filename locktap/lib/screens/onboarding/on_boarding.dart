import 'package:flutter/material.dart';
import 'package:locktap/screens/onboarding/page_indicator.dart';
import 'package:locktap/screens/onboarding/screenshots_grid.dart';
import 'package:locktap/util/app_colors.dart';
import 'package:locktap/util/components/secondary_button.dart';

import '../../util/components/primary_button.dart';

class OnBoardingScreen extends StatelessWidget
    with ScreenshotsGrid, PageIndicator {
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
          const SizedBox(
            height: 42,
          ),
          const Text(
            'Universal data storage',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'sf',
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Relieve yourself of creating and \nmemorizing complex passwords on your own with Locktap',
              style: TextStyle(
                color: AppColors.gray,
                fontFamily: 'sf',
                fontWeight: FontWeight.w100,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          PrimaryButton(
            label: 'Next',
            btnCallback: () {},
          ),
          const SizedBox(
            height: 5,
          ),
          SecondaryButton(
            label: 'skip',
            btnCallback: () {},
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
      ),
    );
  }
}
