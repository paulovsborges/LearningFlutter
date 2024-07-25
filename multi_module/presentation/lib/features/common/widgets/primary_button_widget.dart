import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    super.key,
    required this.label,
    this.isEnabled = true,
    this.isLoading = false,
    this.onTap,
  });

  final String label;
  final bool isEnabled;
  final bool isLoading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final borderColor = isEnabled && !isLoading
        ? Theme.of(context).primaryColor
        : Colors.transparent;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            child: isLoading ? const CircularProgressIndicator() : Text(label),
          ),
        ),
      ),
    );
  }
}
