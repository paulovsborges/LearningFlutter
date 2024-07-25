import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBinding extends StatelessWidget {
  const AppBinding({super.key, required this.child});

  final Widget child;

  // Used to declare global states if any
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => _DummyCubit())],
      child: child,
    );
  }
}

class _DummyCubit extends Cubit<int> {
  _DummyCubit() : super(0);
}
