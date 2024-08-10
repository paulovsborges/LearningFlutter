import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/features/common/ncage_theme.dart';
import 'package:presentation/features/details/details_page.dart';
import 'package:presentation/features/navigation/bottom_nav_module.dart';
import 'package:presentation/features/splash/splash_module.dart';
import 'package:presentation/features/splash/splash_page.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key, required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: NCageTheme.lightTheme(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      // routerConfig: NCageNavigationHelper.router,
    );
  }
}
