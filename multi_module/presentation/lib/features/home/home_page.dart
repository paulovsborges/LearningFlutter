import 'package:flutter/material.dart';
import 'package:presentation/features/common/ncage_assets.dart';
import 'package:presentation/features/common/ncage_labels.dart';
import 'package:presentation/features/home/widgets/banners/home_banner_carousel_widget.dart';
import 'package:presentation/features/home/widgets/banners/home_banner_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/home_page';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                NCageLabels.homeTitle,
                style: Theme.of(context).primaryTextTheme.bodyLarge,
              ),
              HomeBannerCarouselWidget(
                banners: const [
                  HomeBannerWidget(assetPath: NCageAssets.dummyBanner_1),
                  HomeBannerWidget(assetPath: NCageAssets.dummyBanner_2),
                  HomeBannerWidget(assetPath: NCageAssets.dummyBanner_3),
                  HomeBannerWidget(assetPath: NCageAssets.dummyBanner_4),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
