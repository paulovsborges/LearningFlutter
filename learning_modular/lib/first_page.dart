import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:learning_modular/mock_service.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key, required this.service});

  final MockService service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Modular.to.pushReplacementNamed('/second/mister');
                },
                child: const Text('To second page')),
            ElevatedButton(
              onPressed: () {
                var number = service.getRandomEvenNumber();

                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("$number")));
              },
              child: const Text('Get a even number'),
            ),
          ],
        ),
      ),
    );
  }
}
