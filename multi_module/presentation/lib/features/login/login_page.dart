import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String routeName = '/login_page';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('login page'),
      ),
    );
  }
}
