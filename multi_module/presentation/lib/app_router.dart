import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/features/common/ncage_theme.dart';
import 'package:presentation/features/navigation/bottom_nav_module.dart';
import 'package:presentation/features/splash/splash_module.dart';
import 'package:presentation/features/splash/splash_page.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: NCageTheme.lightTheme(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      // routeInformationParser: ,
      // routerDelegate: ,
      // routerConfig: GoRouter(
      //   navigatorKey: parentNavigatorKey,
      //   initialLocation: SplashPage.routeName,
      //   routes: [
      //     ...SplashModule.routes(),
      //     // ...LoginModule.routes(),
      //     ...BottomNavModule.routes(),
      //   ],
      // ),
      routerConfig: CustomNavigationHelper.router,
    );
  }
}

class CustomNavigationHelper {
  static final CustomNavigationHelper _instance =
      CustomNavigationHelper._internal();

  static CustomNavigationHelper get instance => _instance;

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

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  factory CustomNavigationHelper() {
    return _instance;
  }

  CustomNavigationHelper._internal() {
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
