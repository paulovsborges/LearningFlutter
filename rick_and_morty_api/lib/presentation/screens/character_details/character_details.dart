import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterDetails extends StatelessWidget {

  static const String routeParameter = ':id';
  static const String screenRoute = '/character_details';

  const CharacterDetails({super.key, required this.characterId});

  final String characterId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("$characterId"),
      ),
    );
  }
}
