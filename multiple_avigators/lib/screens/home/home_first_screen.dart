import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeFirstScreen extends StatelessWidget {
  const HomeFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      child: const Center(
        child: Text(
          'Home first screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
