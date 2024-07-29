import 'package:flutter/material.dart';
import 'package:presentation/features/common/ncage_theme.dart';
import 'package:presentation/features/navigation/n_cage_navigation_helper.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: NCageTheme.lightTheme(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routerConfig: NCageNavigationHelper.router,
    );
  }
}
