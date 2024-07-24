
import 'package:domain/repository/initialConfig/initial_config_mock_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/features/splash/splash_presenter.dart';

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