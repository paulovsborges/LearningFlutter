import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSecondScreen extends StatelessWidget {
  const HomeSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[400],
      child: const Center(
        child: Text(
          'Home second screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
