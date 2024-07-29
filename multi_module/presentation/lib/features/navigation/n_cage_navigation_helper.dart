import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/features/navigation/bottom_nav_module.dart';
import 'package:presentation/features/splash/splash_module.dart';
import 'package:presentation/features/splash/splash_page.dart';

class NCageNavigationHelper {
  static final NCageNavigationHelper _instance =
      NCageNavigationHelper._internal();

  static NCageNavigationHelper get instance => _instance;

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> searchTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> settingsTabNavigatorKey =
      GlobalKey<NavigatorState>();

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  factory NCageNavigationHelper() {
    return _instance;
  }

  NCageNavigationHelper._internal() {
    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: SplashPage.routeName,
      routes: [
        ...SplashModule.routes(),
        ...BottomNavModule.routes(),
      ],
    );
  }
}
