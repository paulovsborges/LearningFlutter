import 'package:flutter/material.dart';

class CharacterDetails extends StatelessWidget {
  static const String routeParameter = ':id';
  static const String screenRoute = '/character_details';

  const CharacterDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final characterId = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      body: Center(
        child: Text("$characterId"),
      ),
    );
  }
}
