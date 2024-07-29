import 'package:flutter/material.dart';
import 'package:presentation/features/common/ncage_assets.dart';
import 'package:presentation/features/common/ncage_labels.dart';
import 'package:presentation/features/common/widgets/catalog/home_catalog_section_widget.dart';
import 'package:presentation/features/common/widgets/search_text_field.dart';
import 'package:presentation/features/home/widgets/banners/home_banner_carousel_widget.dart';
import 'package:presentation/features/home/widgets/filterShortcut/filters_list_widget.dart';

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  NCageLabels.homeTitle,
                  style: Theme.of(context).primaryTextTheme.bodyLarge,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: SearchTextField(),
                ),
                HomeBannerCarouselWidget(
                  containerHeight: MediaQuery.of(context).size.height * 0.20,
                  banners: const [
                    NCageAssets.dummyBanner_1,
                    NCageAssets.dummyBanner_2,
                    NCageAssets.dummyBanner_3,
                    NCageAssets.dummyBanner_4,
                  ],
                ),
                const SizedBox(height: 16),
                HomeBannerCarouselWidget(
                  containerHeight: MediaQuery.of(context).size.height * 0.15,
                  autoPlayInterval: const Duration(seconds: 12),
                  banners: const [
                    NCageAssets.dummyBanner_1,
                    NCageAssets.dummyBanner_2,
                    NCageAssets.dummyBanner_3,
                    NCageAssets.dummyBanner_4,
                  ],
                ),
                const SizedBox(height: 20),
                const FiltersListWidget(),
                const SizedBox(height: 32),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 200,
                    maxHeight: 300,
                  ),
                  child: const HomeCatalogSectionWidget(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
