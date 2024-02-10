import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:handling_state/main.dart';
import 'package:rxdart/rxdart.dart';

// Handling state using bloc

// class Counter extends BlocBase{
//
//   Stream<int> counter;
//
// }

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
