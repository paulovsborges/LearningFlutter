import 'package:flutter/material.dart';
import 'package:presentation/features/home/widgets/banners/carousel_index_indicator_widget.dart';
import 'package:presentation/features/home/widgets/banners/home_banner_widget.dart';

class HomeBannerCarouselWidget extends StatefulWidget {
  const HomeBannerCarouselWidget({
    super.key,
    required this.banners,
    required this.containerHeight,
    this.autoPlayInterval = const Duration(seconds: 5),
  });

  final List<String> banners;
  final double containerHeight;
  final Duration autoPlayInterval;

  @override
  State<HomeBannerCarouselWidget> createState() =>
      _HomeBannerCarouselWidgetState();
}

class _HomeBannerCarouselWidgetState extends State<HomeBannerCarouselWidget> {
  final _CarouselIndexChangedNotifier _carouselIndexChangedNotifier =
      _CarouselIndexChangedNotifier();

  final PageController _carouselController = PageController();

  bool userDidNotInteractWithPage = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _carouselController.addListener(() {
        _carouselIndexChangedNotifier.onIndexChanged(
          _carouselController.page?.toInt() ?? 0,
        );
      });

      _startPageChangeLooping();
    });
  }

  void _startPageChangeLooping() async {
    if (!mounted) return;

    while (userDidNotInteractWithPage) {
      await Future.delayed(widget.autoPlayInterval);

      int nextIndex = _carouselIndexChangedNotifier.value + 1;

      if (nextIndex > widget.banners.length - 1) {
        nextIndex = 0;
      }

      _carouselController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: widget.containerHeight,
          child: GestureDetector(
            onPanCancel: () {
              userDidNotInteractWithPage = false;
            },
            child: PageView.builder(
              controller: _carouselController,
              itemCount: widget.banners.length,
              itemBuilder: (internalContext, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: HomeBannerWidget(
                    assetPath: widget.banners[index],
                  ),
                );
              },
            ),
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
                    totalCount: widget.banners.length,
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

class _CarouselIndexChangedNotifier extends ValueNotifier<int> {
  _CarouselIndexChangedNotifier() : super(0);

  void onIndexChanged(int index) {
    if (index == value) return;
    value = index;
    notifyListeners();
  }
}
