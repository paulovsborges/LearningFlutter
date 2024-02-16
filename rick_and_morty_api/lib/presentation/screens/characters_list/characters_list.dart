import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/entity/character.dart';
import '../character_details/character_details.dart';
import 'character_item.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({super.key, required this.characters});

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: characters.length,
          itemBuilder: (_, index) {
            return CharacterItem(
              character: characters[index],
              onCharacterClick: (characterId) {
                var characterId = characters[index].id;

                Modular.to.pushNamed(
                  '${CharacterDetails.screenRoute}/$characterId',
                );
              },
            );
          }),
    );
  }
}
