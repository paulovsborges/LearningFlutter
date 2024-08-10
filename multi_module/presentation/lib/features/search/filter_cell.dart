import 'package:flutter/material.dart';

class FilterCell extends StatelessWidget {
  const FilterCell({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
