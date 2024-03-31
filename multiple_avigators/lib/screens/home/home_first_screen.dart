import 'package:flutter/cupertino.dart';

class HomeFirstScreen extends StatelessWidget {
  const HomeFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Home first screen',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
