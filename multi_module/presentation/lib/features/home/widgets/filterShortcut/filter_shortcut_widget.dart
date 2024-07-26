import 'package:flutter/material.dart';
import 'package:presentation/features/common/ncage_colors.dart';

class FilterShortcutWidget extends StatelessWidget {
  const FilterShortcutWidget({
    super.key,
    required this.iconData,
    required this.label,
  });

  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: NCageColors.whiteFFFFFF,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Icon(
                  iconData,
                  color: NCageColors.green008A45,
                ),
              ),
            ),
          ),
        ),
        Text(
          label,
          style: Theme.of(context).primaryTextTheme.displayMedium,
        ),
      ],
    );
  }
}
