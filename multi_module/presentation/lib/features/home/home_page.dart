import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/home_page';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('home page'),
      ),
    );
  }
}
