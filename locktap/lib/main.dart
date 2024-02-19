import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:locktap/controller/main_navigation_state.dart';
import 'package:locktap/screens/home/home_screen.dart';
import 'package:locktap/screens/onboarding/on_boarding.dart';
import 'package:locktap/screens/password/password.dart';

import 'app_module.dart';

void main() {
  AppModule();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => GetIt.I.get<MainNavigationState>(),
        child: BlocBuilder<MainNavigationState, AppScreens>(
          builder: (context, state) {
            return _MyApp(
              screen: state,
            );
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _MyApp extends StatelessWidget {
  _MyApp({super.key, required this.screen});

  final AppScreens screen;
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        // This callback is triggered when a pop has already happened
        if (!didPop) {
          _navigatorKey.currentState?.maybePop();
        }
      },
      canPop: false,
      child: Navigator(
        key: _navigatorKey,
        pages: [
          const MaterialPage(
            child: OnBoardingScreen(),
            // key: OnBoardingScreen.valueKey,
          ),
          switch (screen) {
            OnBoarding() => const MaterialPage(
                child: OnBoardingScreen(),
                key: OnBoardingScreen.valueKey,
              ),
            Password() => const MaterialPage(
                child: PasswordScreen(),
                key: PasswordScreen.valueKey,
              ),
            Home() =>
              const MaterialPage(child: HomeScreen(), key: HomeScreen.valueKey),
            AppScreens() => const MaterialPage(
                child: Placeholder(),
              ),
          }
        ],
        onPopPage: (route, result) {
          print('## ${route.settings.name}');
          return route.didPop(result);
        },
      ),
    );
  }
}
