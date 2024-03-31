import 'package:flutter/material.dart';
import 'package:multiple_avigators/bottom_nav_container.dart';
import 'package:multiple_avigators/screens/favorites/favorites_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> mainNavNavigatorKey = GlobalKey();

  bool canPop = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: mainNavNavigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PopScope(
        onPopInvoked: (didPop){

        },
        canPop: false,
        child: Navigator(
          initialRoute: BottomNavContainer.routeName,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case FavoritesDetailsScreen.routeName:
                return _generateRoute(const FavoritesDetailsScreen());
              default:
                return _generateRoute(const BottomNavContainer());
            }
          },
        ),
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
