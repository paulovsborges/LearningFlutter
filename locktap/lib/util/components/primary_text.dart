import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  const PrimaryText({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'sf',
        fontWeight: FontWeight.w600,
        fontSize: 24,
      ),
    );
  }
}
