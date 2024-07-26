import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/features/common/ncage_theme.dart';
import 'package:presentation/features/home/home_module.dart';
import 'package:presentation/features/login/login_module.dart';
import 'package:presentation/features/splash/splash_module.dart';
import 'package:presentation/features/splash/splash_page.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: NCageTheme.lightTheme(),
      themeMode: ThemeMode.light,

      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        initialLocation: SplashPage.routeName,
        routes: [
          ...SplashModule.routes(),
          ...LoginModule.routes(),
          ...HomeModule.routes(),
        ],
      ),
    );
  }
}
