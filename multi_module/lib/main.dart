import 'package:domain/repository/initialConfig/initial_config_repository.dart';
import 'package:domain/repository/initialConfig/initial_config_mock_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/app_router.dart';
import 'package:presentation/features/splash/splash_presenter.dart';

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
        BlocProvider(
          create: (_) => SplashPresenter(
            repository: InitialConfigMockRepository(),
          ),
        ),
      ],
      child: child,
    );
  }
}
