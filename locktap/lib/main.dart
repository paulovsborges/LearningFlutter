import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:locktap/controller/main_navigation_controller.dart';
import 'package:locktap/screens/home/home_screen.dart';
import 'package:locktap/screens/onboarding/on_boarding.dart';
import 'package:locktap/screens/password/password.dart';

import 'app_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => GetIt.I.get<MainNavigationController>(),
        child: BlocBuilder<MainNavigationController, AppScreensState>(
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

  final AppScreensState screen;
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
            OnBoardingScreenState() => const MaterialPage(
                child: OnBoardingScreen(),
                key: OnBoardingScreen.valueKey,
              ),
            PasswordScreenState() => const MaterialPage(
                child: PasswordScreen(),
                key: PasswordScreen.valueKey,
              ),
            HomeScreenState() => const MaterialPage(
                child: HomeScreen(),
                key: HomeScreen.valueKey,
              ),
            AppScreensState() => const MaterialPage(
                child: Placeholder(),
              ),
          }
        ],
        onPopPage: (route, result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
