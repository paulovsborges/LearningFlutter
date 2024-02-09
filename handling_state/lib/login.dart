import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:handling_state/main.dart';
import 'package:provider/provider.dart';

// Handling states using ChangeNotifier

class Counter with ChangeNotifier {
  int currentCount = 0;

  void incrementCount() {
    currentCount++;
    notifyListeners();
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Consumer<Counter>(
          builder: (context, counter, child) {
            return Text('current count ${counter.currentCount}');
          },
        ),
        ElevatedButton(
            onPressed: () {
              var counter = context.read<Counter>();
              counter.incrementCount();
            },
            child: const Text('Increment')),
        const SizedBox(
          height: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(Screens.login.label),
                ElevatedButton(
                    onPressed: () {
                      context.pushReplacement(Screens.home.route);
                    },
                    child: const Text('Go to home')),
                const SizedBox(
                  height: 100,
                ),
              ],
            )
          ],
        ),
      ],
    ));
  }
}
