import 'package:flutter/material.dart';
import 'package:multiple_avigators/screens/favorites/favorites_details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  static const String routeName = '/favorites';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[400],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Favorite screen',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                FavoritesDetailsScreen.routeName,
              );
              Navigator.pop(context);
            },
            child: const Text('Go to details'),
          ),
        ],
      ),
    );
  }
}
