import 'package:flutter/material.dart';
import 'package:locktap/util/app_colors.dart';

mixin PageIndicator {
  Widget buildPageIndicator(int currentIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPageIndicatorItem(currentIndex == 0),
        const SizedBox(
          width: 5,
        ),
        _buildPageIndicatorItem(currentIndex == 1),
        const SizedBox(
          width: 5,
        ),
        _buildPageIndicatorItem(currentIndex == 2),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }

  Widget _buildPageIndicatorItem(bool isSelectedIndex) {
    Color backgroundColor;

    if (isSelectedIndex) {
      backgroundColor = Colors.white;
    } else {
      backgroundColor = AppColors.gray200;
    }

    return Container(
      height: 4,
      width: 24,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: backgroundColor),
    );
  }
}
