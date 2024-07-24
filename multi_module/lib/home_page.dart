import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.bloc});

  final CounterCubit bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, int>(
      bloc: bloc,
      builder: (internalContext, state) {
        return Scaffold(
          body: Center(
            child: ElevatedButton(
                onPressed: () {
                  bloc.increment();
                },
                child: Text('Home page ${state}')),
          ),
        );
      },
    );
  }
}
