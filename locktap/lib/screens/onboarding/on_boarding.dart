import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:locktap/main_navigation_state.dart';
import 'package:locktap/screens/onboarding/page_indicator.dart';
import 'package:locktap/screens/onboarding/screenshots_grid.dart';
import 'package:locktap/screens/password/password.dart';
import 'package:locktap/util/components/primary_text.dart';
import 'package:locktap/util/components/secondary_button.dart';

import '../../model/onboarding/on_boarding_data.dart';
import '../../util/app_style.dart';
import '../../util/components/primary_button.dart';
import '../../util/components/secondary_text.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const valueKey = ValueKey('OnBoardingScreen');

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with ScreenshotsGrid, PageIndicator {
  final List<OnBoardingData> steps = [
    OnBoardingData.firstStep,
    OnBoardingData.secondStep,
    OnBoardingData.thirdStep,
  ];

  void _nextStep() {
    setState(() {
      currentIndex++;
    });
  }

  void _goToPasswordScreen() {
    var controller = GetIt.I.get<MainNavigationState>();
    controller.goToScreen(Password());
  }

  int currentIndex = 0;

  Widget _buildBottomSheetView(int currentIndex) {
    return Container(
      color: AppColors.secondaryBackground,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          buildPageIndicator(currentIndex),
          const SizedBox(
            height: 42,
          ),
          PrimaryText(label: steps[currentIndex].label),
          Container(
            padding: const EdgeInsets.all(20),
            child: SecondaryText(
              description: steps[currentIndex].description,
            ),
          ),
          PrimaryButton(
            label: 'Next',
            btnCallback: () {
              _nextStep();
            },
          ),
          const SizedBox(
            height: 5,
          ),
          SecondaryButton(
            label: 'skip',
            btnCallback: () {
              _goToPasswordScreen();
            },
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
              steps[currentIndex].screenshots,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildBottomSheetView(currentIndex),
            ],
          ),
        ],
      ),
    );
  }
}
