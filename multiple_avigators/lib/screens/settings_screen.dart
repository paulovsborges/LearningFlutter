import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[400],
      child: const Center(
        child: Text(
          'Settings screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
