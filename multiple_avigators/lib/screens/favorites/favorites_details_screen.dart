import 'package:flutter/material.dart';

class FavoritesDetailsScreen extends StatelessWidget {
  const FavoritesDetailsScreen({super.key});

  static const String routeName = '/favorites_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Favorite details screen',
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
      )
    );
  }
}
