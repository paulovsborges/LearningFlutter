import 'package:flutter/material.dart';
import 'package:multiple_avigators/screens/favorites/favorites_screen.dart';
import 'package:multiple_avigators/screens/home/home_first_screen.dart';
import 'package:multiple_avigators/screens/home/home_second_screen.dart';
import 'package:multiple_avigators/screens/settings_screen.dart';
import 'package:multiple_avigators/screens/support_screen.dart';

class BottomNavContainer extends StatelessWidget {
  const BottomNavContainer({
    super.key,
    required this.navigatorKey,
  });

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: HomeFirstScreen.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case SupportScreen.routeName:
            return _generateRoute(const SupportScreen());
          case SettingsScreen.routeName:
            return _generateRoute(const SettingsScreen());
          case FavoritesScreen.routeName:
            return _generateRoute(const FavoritesScreen());
          case HomeSecondScreen.routeName:
            return _generateRoute(const HomeSecondScreen());
          default:
            return _generateRoute(const HomeFirstScreen());
        }
      },
    );
  }

  MaterialPageRoute _generateRoute(Widget child) {
    return MaterialPageRoute(
      builder: (_) {
        return child;
      },
    );
  }
}
