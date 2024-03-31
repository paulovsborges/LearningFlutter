import 'package:flutter/material.dart';
import 'package:multiple_avigators/main_bottom_nav.dart';
import 'package:multiple_avigators/screens/favorites/favorites_details_screen.dart';
import 'package:multiple_avigators/screens/favorites/favorites_screen.dart';
import 'package:multiple_avigators/screens/home/home_first_screen.dart';
import 'package:multiple_avigators/screens/home/home_second_screen.dart';
import 'package:multiple_avigators/screens/settings_screen.dart';
import 'package:multiple_avigators/screens/support_screen.dart';

class BottomNavContainer extends StatefulWidget {
  const BottomNavContainer({
    super.key,
  });

  static const String routeName = '/';

  @override
  State<BottomNavContainer> createState() => _BottomNavContainerState();
}

class _BottomNavContainerState extends State<BottomNavContainer> {
  final GlobalKey<NavigatorState> bottomNavNavigatorKey = GlobalKey();
  int? currentSelectedIndex;

  void _updateIndex(int index) {
    setState(() {
      currentSelectedIndex = currentSelectedIndex != index ? index : null;
      _updateRoute();
    });
  }

  void _updateRoute() {
    switch (currentSelectedIndex) {
      case 0:
        bottomNavNavigatorKey.currentState?.pushNamed(SupportScreen.routeName);
        break;
      case 1:
        bottomNavNavigatorKey.currentState
            ?.pushNamed(FavoritesScreen.routeName);
        break;
      case 2:
        bottomNavNavigatorKey.currentState?.pushNamed(SettingsScreen.routeName);
        break;
      default:
        bottomNavNavigatorKey.currentState?.popUntil((route) => route.isFirst);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: bottomNavNavigatorKey,
        initialRoute: HomeFirstScreen.routeName,
        onGenerateRoute: (settings) {
          if (settings.name == FavoritesDetailsScreen.routeName) {
            Navigator.pushNamed(context, FavoritesDetailsScreen.routeName);
            return _generateRoute(const SizedBox());
          }

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
      ),
      bottomNavigationBar: MainBottomNav(
        currentSelectedIndex: currentSelectedIndex,
        onItemClick: _updateIndex,
      ),
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
