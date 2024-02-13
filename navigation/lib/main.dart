import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: FirstPage.route,
      routes: {
        FirstPage.route: (_) => const FirstPage(),
        SecondPage.route: (_) => const SecondPage(),
        ThirdPage.route: (_) => const ThirdPage(),
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  static const route = 'first_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SecondPage.route);
            },
            child: const Text('Next page')),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  static const route = 'second_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(ThirdPage.route, arguments: 'to the start')
                  .then((value) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(value as String)));
              });
            },
            child: const Text('Next page')),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  static const route = 'third_page';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // Navigator.of(context).pop('went back');
              Navigator.of(context).pushNamedAndRemoveUntil(FirstPage.route, (route) => false);
            },
            child: Text(args)),
      ),
    );
  }
}
