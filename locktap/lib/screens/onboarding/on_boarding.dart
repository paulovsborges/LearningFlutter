import 'package:flutter/material.dart';
import 'package:locktap/screens/onboarding/page_indicator.dart';
import 'package:locktap/screens/onboarding/screenshots_grid.dart';
import 'package:locktap/util/app_colors.dart';
import 'package:locktap/util/components/secondary_button.dart';

import '../../model/onboarding/on_boarding_data.dart';
import '../../util/components/primary_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

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
          Text(
            steps[currentIndex].label,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'sf',
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              steps[currentIndex].description,
              style: const TextStyle(
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
            btnCallback: () {
              _nextStep();
            },
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
