import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_module/home_page.dart';
import 'package:presentation/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBinding(
      child: MaterialApp(
        home: AppRouter(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class AppBinding extends StatelessWidget {
  const AppBinding({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterCubit()),
      ],
      child: child,
    );
  }
}
