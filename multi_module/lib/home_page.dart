import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.cubit});

  final CounterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (internalContext, state) {
        return Scaffold(
          body: Center(
            child: ElevatedButton(
                onPressed: () {
                  cubit.increment();
                },
                child: Text('Home page ${cubit.state}')
            ),
          ),
        );
      },
    );
  }
}
