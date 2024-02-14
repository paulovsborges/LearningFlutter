import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int?> {
  CounterCubit() : super(null);

  void generateRandomNumber() {
    int number;
    do {
      number = Random().nextInt(100);
    } while (number == state);

    emit(number);
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    var counterWatcher = context.watch<CounterCubit>().state;
    //
    // BlocProvider(create: (_) => CounterCubit(),child: ,)

    // return BlocProvider(
    //   create: (_) => CounterCubit(),
    //   child: Scaffold(
    //     appBar: AppBar(),
    //     backgroundColor: Colors.cyan,
    //     body: Center(
    //       child: Column(
    //         children: [
    //           Text(counterWatcher != null
    //               ? "$counterWatcher"
    //               : "Click the button below"),
    //           ElevatedButton(onPressed: () {}, child: const Text('Click')),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.cyan,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                counterWatcher != null
                    ? "$counterWatcher"
                    : "Click the button below",
                style: const TextStyle(color: Colors.white)),
            ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().generateRandomNumber();
              },
              child: const Text('Click'),
            ),
          ],
        ),
      ),
    );
  }
}
