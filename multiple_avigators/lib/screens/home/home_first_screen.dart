import 'package:flutter/material.dart';
import 'package:multiple_avigators/screens/home/home_second_screen.dart';

class HomeFirstScreen extends StatelessWidget {
  const HomeFirstScreen({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Home first screen',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, HomeSecondScreen.routeName);
            },
            child: const Text('Next screen'),
          )
        ],
      ),
    );
  }
}
