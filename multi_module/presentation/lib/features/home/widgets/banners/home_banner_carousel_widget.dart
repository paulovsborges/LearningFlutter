import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:presentation/features/home/widgets/banners/carousel_index_indicator_widget.dart';

class HomeBannerCarouselWidget extends StatelessWidget {
  HomeBannerCarouselWidget({
    super.key,
    required this.banners,
  });

  final List<Widget> banners;

  final CarouselController _controller = CarouselController();
  final CarouselIndexChangedNotifier _carouselIndexChangedNotifier =
      CarouselIndexChangedNotifier();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _controller,
          items: banners,
          options: CarouselOptions(
            autoPlay: true,
            onPageChanged: (index, _) {
              _carouselIndexChangedNotifier.onIndexChanged(index);
            },
          ),
        ),
        Positioned(
          bottom: 10,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: _carouselIndexChangedNotifier,
                builder: (_, int currentIndex, ___) {
                  return CarouselIndexIndicatorWidget(
                    totalCount: banners.length,
                    currentIndex: currentIndex,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CarouselIndexChangedNotifier extends ValueNotifier<int> {
  CarouselIndexChangedNotifier() : super(0);

  void onIndexChanged(int index) {
    value = index;
    notifyListeners();
  }
}
