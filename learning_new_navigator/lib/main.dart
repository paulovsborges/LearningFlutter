import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

enum AppScreen { home, second, third }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppScreen currentScreen = AppScreen.home;

  void _updateCurrentScreen(AppScreen nextScreen) {
    setState(() {
      currentScreen = nextScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Navigator(
        pages: [
          switch (currentScreen) {
            AppScreen.home => MaterialPage(
                child: MyHomePage(
                  callback: () {
                    _updateCurrentScreen(AppScreen.second);
                  },
                ),
                key: MyHomePage.valueKey,
              ),
            AppScreen.second => MaterialPage(
                child: SecondPage(callback: () {
                  _updateCurrentScreen(AppScreen.third);
                }),
                key: SecondPage.valueKey,
              ),
            AppScreen.third => MaterialPage(
                child: ThirdPage(callback: () {
                  _updateCurrentScreen(AppScreen.home);
                }),
                key: ThirdPage.valueKey,
              ),
          }
        ],
        onPopPage: (route, result) {
          var t = route as MaterialPage;
          var f = t.key == SecondPage.valueKey;

          return route.didPop(result);
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const valueKey = ValueKey('MyHomePage');

  const MyHomePage({super.key, required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Center(
          child: ElevatedButton(
              onPressed: callback, child: const Text('Go to next page')),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  static const valueKey = ValueKey('SecondPage');

  const SecondPage({super.key, required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: ElevatedButton(
              onPressed: callback, child: const Text('Go to next page')),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  static const valueKey = ValueKey('ThirdPage');

  const ThirdPage({super.key, required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: ElevatedButton(
              onPressed: callback, child: const Text('Go to next page')),
        ),
      ),
    );
  }
}
