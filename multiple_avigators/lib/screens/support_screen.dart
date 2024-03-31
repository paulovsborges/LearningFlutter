import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  static const String routeName = '/support';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[400],
      child: const Center(
        child: Text(
          'support screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
