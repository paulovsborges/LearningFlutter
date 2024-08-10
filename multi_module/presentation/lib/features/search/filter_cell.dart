import 'package:flutter/material.dart';

class FilterCell extends StatefulWidget {
  const FilterCell({super.key, required this.label});

  final String label;

  @override
  State<FilterCell> createState() => _FilterCellState();
}

class _FilterCellState extends State<FilterCell> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 16),
              Visibility(
                visible: isSelected,
                child: const Icon(Icons.check),
              )
            ],
          ),
        ),
      ),
    );
  }
}
