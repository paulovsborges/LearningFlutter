
import 'package:flutter/material.dart';

class MainBottomNav extends StatelessWidget {
  const MainBottomNav({
    super.key,
    required this.onItemClick,
    required this.currentSelectedIndex,
  });

  final int? currentSelectedIndex;
  final Function(int) onItemClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.blueGrey),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              onItemClick(0);
            },
            child: Icon(
              currentSelectedIndex == 0 ? Icons.check : Icons.contact_support,
            ),
          ),
          GestureDetector(
            onTap: () {
              onItemClick(1);
            },
            child: Icon(
              currentSelectedIndex == 1 ? Icons.check : Icons.favorite,
            ),
          ),
          GestureDetector(
            onTap: () {
              onItemClick(2);
            },
            child: Icon(
              currentSelectedIndex == 2 ? Icons.check : Icons.settings,
            ),
          ),
        ],
      ),
    );
  }
}
