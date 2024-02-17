import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin ScreenshotsGrid {
  Widget buildScreenshotsFrid(List<String> assets) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 34,
              ),
              Image.asset(assets[0]),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                assets[1],
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            verticalDirection: VerticalDirection.up,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
              ),
              Image.asset(assets[2]),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                assets[3],
              ),
            ],
          ),
        ),
      ],
    );
  }

}
