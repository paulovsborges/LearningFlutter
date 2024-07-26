import 'package:flutter/material.dart';
import 'package:presentation/features/common/ncage_colors.dart';

class CarouselIndexIndicatorWidget extends StatelessWidget {
  const CarouselIndexIndicatorWidget({
    super.key,
    required this.totalCount,
    required this.currentIndex,
  });

  final int totalCount;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final List<Widget> indicators = [];

    for (var i = 0; i < totalCount; i++) {
      final indicatorColor =
          i == currentIndex ? NCageColors.whiteFFFFFF : NCageColors.gray454F63;

      final indicator = Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: indicatorColor,
        ),
      );

      indicators.add(indicator);
    }

    return Row(
      children: indicators,
    );
  }
}
