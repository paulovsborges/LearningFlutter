import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/domain/entity/character.dart';

class CharacterItem extends StatelessWidget {
  CharacterItem(
      {super.key, required this.character, required this.onCharacterClick});

  final Character character;
  final Function(int characterId) onCharacterClick;

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

  final GlobalKey _imageKey = GlobalKey(debugLabel: 'CharacterImage');

  double _dynamicTextSize(
    String text,
    double maxWidth,
    double? preferredInitialSize,
  ) {
    var targetFontSize = preferredInitialSize ?? 16;

    do {
      TextPainter painter = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(fontSize: targetFontSize),
        ),
        maxLines: 1,
        textDirection: TextDirection.ltr,
      )..layout(minWidth: 0, maxWidth: maxWidth);

      var painterWidth = painter.size.width;

      if (painterWidth < maxWidth) {
        break;
      }

      targetFontSize--;
    } while (true);

    return targetFontSize;
  }

  Widget _buildTextWidget(
    BoxConstraints constraints,
    String text,
    TextStyle style,
  ) {
    return LayoutBuilder(
      builder: (context, _) {
        var imageRender =
            _imageKey.currentContext?.findRenderObject() as RenderBox;

        var imageWidth = imageRender.size.width;

        var maxWidthPadding = 40;

        var maxWidth =
            (constraints.maxWidth - imageWidth) - maxWidthPadding;

        var textSize = _dynamicTextSize(text, maxWidth, null);

        return Text(
          text,
          style: style.copyWith(fontSize: textSize),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color.fromARGB(255, 60, 62, 67);

    return GestureDetector(
      onTap: () {
        onCharacterClick(character.id);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: backgroundColor),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  key: _imageKey,
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
                      _buildTextWidget(
                        constraints,
                        character.name,
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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
                          _buildTextWidget(
                            constraints,
                            "${character.status} - ${character.gender}",
                            const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
