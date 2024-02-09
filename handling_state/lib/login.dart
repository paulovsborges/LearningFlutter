import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:handling_state/main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
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
                )
              ],
            )
          ],
        ),
      ],
    ));
  }
}
