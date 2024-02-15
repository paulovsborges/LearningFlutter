import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_api/main.dart';
import 'package:rick_and_morty_api/screens/characters_list/character_item.dart';

import '../../domain/character.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CubitCharacters>().getCharacters();
    var characters = context.watch<CubitCharacters>().state;

    return Expanded(
      child: ListView.builder(
          itemCount: characters.length,
          itemBuilder: (_, index) {
            return CharacterItem(character: characters[index]);
          }),
    );
  }
}
