import 'dart:math';

import 'package:flutter/material.dart';
import 'package:presentation/features/common/ncage_assets.dart';
import 'package:presentation/features/common/ncage_labels.dart';
import 'package:presentation/features/common/widgets/catalog/home_catalog_section_widget.dart';
import 'package:presentation/features/common/widgets/search_text_field.dart';
import 'package:presentation/features/details/details_page.dart';
import 'package:presentation/features/details/details_presenter.dart';
import 'package:presentation/features/home/widgets/banners/home_banner_carousel_widget.dart';
import 'package:presentation/features/home/widgets/filterShortcut/filters_list_widget.dart';
import 'package:presentation/features/navigation/n_cage_navigation_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.presenter,
  });

  static const String routeName = '/home_page';

  final DetailsPresenter presenter;

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
                GestureDetector(
                  child: Text(
                    NCageLabels.homeTitle,
                    style: Theme.of(context).primaryTextTheme.bodyLarge,
                  ),
                  onTap: (){
                    presenter.setId('12312321 ${Random().nextInt(10000)}');
                    context.myRouterNavigate(DetailsPage.routeName);
                  },
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
                GestureDetector(
                  child: const FiltersListWidget(),
                ),
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
