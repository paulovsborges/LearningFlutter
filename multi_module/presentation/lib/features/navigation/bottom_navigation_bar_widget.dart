import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.onTap,
  });

  final Function(int tapIndex) onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              child: const Icon(Icons.home_outlined),
              onTap: () {
                onTap(0);
              },
            ),
            GestureDetector(
              child: const Icon(Icons.search_rounded),
              onTap: () {
                onTap(1);
              },
            ),
            GestureDetector(
              child: const Icon(Icons.perm_identity_rounded),
              onTap: () {
                onTap(2);
              },
            ),
          ],
        ),
      ),
    );
  }
}
