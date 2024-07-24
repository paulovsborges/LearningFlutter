import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _count = 0;

  final _calculator = Calculator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                _count = _calculator.addOne(_count);
              });
            },
            child: Text('Home page ${_count}')),
      ),
    );
  }
}
