import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/domain/character.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});

  final Character character;

  Color _getStatusColor() {
    switch (character.status) {
      case "Alive":
        return const Color.fromARGB(255, 0, 255, 0);
      case "Dead":
        return const Color.fromARGB(255, 255, 0, 0);
      default:
        return const Color.fromARGB(155, 158, 158, 158);
    }
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color.fromARGB(255, 60, 62, 67);

    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: backgroundColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(character.image),
                  fit: BoxFit.fill,
                ),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: _getStatusColor(),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${character.status} - ${character.gender}",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
