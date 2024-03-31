import 'package:flutter/material.dart';
import 'package:multiple_avigators/bottom_nav_container.dart';
import 'package:multiple_avigators/main_bottom_nav.dart';
import 'package:multiple_avigators/screens/favorites/favorites_screen.dart';
import 'package:multiple_avigators/screens/settings_screen.dart';
import 'package:multiple_avigators/screens/support_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? currentSelectedIndex;

  final GlobalKey<NavigatorState> bottomNavNavigatorKey = GlobalKey();
  final GlobalKey<NavigatorState> mainNavNavigatorKey = GlobalKey();

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
    return MaterialApp(
      key: mainNavNavigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: BottomNavContainer(
          navigatorKey: bottomNavNavigatorKey,
        ),
        bottomNavigationBar: MainBottomNav(
          currentSelectedIndex: currentSelectedIndex,
          onItemClick: _updateIndex,
        ),
      ),
    );
  }
}
