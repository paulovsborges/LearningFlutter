import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/features/home/home_page.dart';
import 'package:presentation/features/login/login_page.dart';
import 'package:presentation/features/splash/splash_page.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        initialLocation: SplashPage.routeName,
        routes: [
          GoRoute(
            path: SplashPage.routeName,
            builder: (routeContext, state) {
              return const SplashPage();
            },
          ),
          GoRoute(
            path: LoginPage.routeName,
            builder: (routeContext, state) {
              return const LoginPage();
            },
          ),
          GoRoute(
            path: HomePage.routeName,
            builder: (routeContext, state) {
              return const HomePage();
            },
          ),
        ],
      ),
    );
  }
}
