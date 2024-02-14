import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_cubit/second_page.dart';

class CubitCounter extends Cubit<int?> {
  CubitCounter() : super(null);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CubitCounter(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Learning cubit'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  BlocBuilder<CubitCounter, int?>(builder: (context, state) {
                    return Text(
                        state != null ? "$state" : "Click the button below");
                  }),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('Click')),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return BlocProvider(
                                create: (_) => CounterCubit(),
                                child: const SecondPage(),
                              );
                            },
                          ),
                        );
                      },
                      child: const Text('Go to next page')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
