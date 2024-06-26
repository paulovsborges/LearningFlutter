import 'package:flutter/material.dart';

class HomeSecondScreen extends StatelessWidget {
  const HomeSecondScreen({super.key});

  static const String routeName = '/home_second_screen';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[400],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Home second screen',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back'),
          ),
        ],
      ),
    );
  }
}
