import 'package:flutter/material.dart';
import 'package:handling_state/main.dart';

// Handling state using bloc

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(Screens.home.label),



          ],
        ),
      ),
    );
  }
}
