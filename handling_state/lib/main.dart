import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:handling_state/login.dart';

void main() {
  runApp(const MyApp());
}

enum Screens {
  login(route: '/home', label: 'Login screen'),
  home(route: '/login', label: 'Home screen');

  const Screens({required this.route, required this.label});

  final String route;
  final String label;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: MaterialApp.router(
        title: 'navigation app',
        routerConfig: getRouter(),
      ),
    ));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Screens.home.label),
      ),
    );
  }
}

GoRouter getRouter() {
  return GoRouter(initialLocation: Screens.login.route, routes: [
    GoRoute(
      path: Screens.login.route,
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
        path: Screens.home.route,
        builder: (context, state) {
          return const HomeScreen();
        }),
  ]);
}
