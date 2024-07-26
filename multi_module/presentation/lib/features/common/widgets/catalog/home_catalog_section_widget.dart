import 'package:flutter/material.dart';
import 'package:presentation/features/common/ncage_assets.dart';
import 'package:presentation/features/common/widgets/catalog/catalog_product_item_widget.dart';

class HomeCatalogSectionWidget extends StatelessWidget {
  const HomeCatalogSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Row(
          children: [
            Text(
              'Test',
              style: theme.primaryTextTheme.bodyMedium,
            ),
            const Spacer(),
            Text(
              'See more',
              style: theme.primaryTextTheme.displayMedium,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return const CatalogProductItemWidget(
                imagePath: NCageAssets.dummyProductImage,
                shortDescription:
                    'This is supposed to be a short description of the product but',
                normalPrice: 20,
                onSalePrice: 15,
                onSalePercentage: 10,
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(width: 2);
            },
            itemCount: 10,
            shrinkWrap: true,
          ),
        )
      ],
    );
  }
}
