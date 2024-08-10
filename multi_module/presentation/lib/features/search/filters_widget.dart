import 'package:flutter/material.dart';
import 'package:presentation/features/search/filter_cell.dart';

class FiltersWidget extends StatefulWidget {
  const FiltersWidget({super.key, required this.filters});

  final List<String> filters;

  @override
  State<FiltersWidget> createState() => _FiltersWidgetState();
}

class _FiltersWidgetState extends State<FiltersWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      runSpacing: 8.0,
      spacing: 8,
      children: List.generate(
        widget.filters.length,
        (index) {
          return FilterCell(label: widget.filters[index]);
        },
      ),
    );
  }
}
