import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  static const String routeName = '/favorites';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[400],
      child: const Center(
        child: Text(
          'Favorite screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
