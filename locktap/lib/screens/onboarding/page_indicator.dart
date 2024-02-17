import 'package:flutter/material.dart';

mixin PageIndicator {
  Widget buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPageIndicatorItem(),
        const SizedBox(
          width: 5,
        ),
        _buildPageIndicatorItem(),
        const SizedBox(
          width: 5,
        ),
        _buildPageIndicatorItem(),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }

  Widget _buildPageIndicatorItem() {
    return Container(
      height: 4,
      width: 24,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white),
    );
  }
}
