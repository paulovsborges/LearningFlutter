import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_api/main.dart';

import '../../../domain/entity/character.dart';
import 'character_item.dart';
import 'characters_list_state.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({super.key, required this.characters});

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: characters.length,
          itemBuilder: (_, index) {
            return CharacterItem(character: characters[index]);
          }),
    );
  }
}
