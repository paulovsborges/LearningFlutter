import 'package:flutter/material.dart';
import 'package:presentation/features/home/widgets/filterShortcut/filter_shortcut_widget.dart';

class FiltersListWidget extends StatelessWidget {
  const FiltersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: FilterShortcutWidget(
            iconData: Icons.add,
            label: 'filter 1',
          ),
        ),
        Expanded(
          child: FilterShortcutWidget(
            iconData: Icons.add,
            label: 'filter 2',
          ),
        ),
        Expanded(
          child: FilterShortcutWidget(
            iconData: Icons.add,
            label: 'filter 3',
          ),
        ),
        Expanded(
          child: FilterShortcutWidget(
            iconData: Icons.add,
            label: 'filter 4',
          ),
        ),
        Expanded(
          child: FilterShortcutWidget(
            iconData: Icons.add,
            label: 'filter 5',
          ),
        ),
      ],
    );
  }
}
