import 'package:flutter/material.dart';
import 'package:presentation/features/common/ncage_colors.dart';

class CatalogProductItemWidget extends StatelessWidget {
  const CatalogProductItemWidget({
    super.key,
    required this.imagePath,
    required this.shortDescription,
    required this.normalPrice,
    this.onSalePrice,
    this.onSalePercentage,
  });

  final String imagePath;
  final String shortDescription;
  final double? normalPrice;
  final double? onSalePrice;
  final int? onSalePercentage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Wrap(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.48,
          child: Container(
            color: NCageColors.whiteFFFFFF,
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      imagePath,
                      height: 150,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        decoration: BoxDecoration(
                            color: NCageColors.greenEDF7ED,
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          child: Text(
                            '-$onSalePercentage%',
                            style: TextStyle(
                              color: NCageColors.green008A45,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shortDescription,
                        style: theme.primaryTextTheme.displayMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Visibility(
                            visible: onSalePrice != null,
                            child: Text(
                              '$normalPrice',
                              style: theme.primaryTextTheme.bodySmall
                                  ?.copyWith(
                                      color: NCageColors.gray9DA2AC,
                                      decoration: TextDecoration.lineThrough),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            onSalePrice == null
                                ? '$normalPrice'
                                : '$onSalePrice',
                            style: theme.primaryTextTheme.bodySmall,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
