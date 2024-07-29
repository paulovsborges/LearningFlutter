import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/features/navigation/bottom_navigation_bar_widget.dart';

class BottomNavContainerPage extends StatelessWidget {
  const BottomNavContainerPage({
    super.key,
    required this.child,
  });

  static const String routeName = '/bottom_nav_container';

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBarWidget(
        onTap: (index) {
          child.goBranch(
            index,
            initialLocation: index == child.currentIndex,
          );
        },
      ),
    );
  }
}
