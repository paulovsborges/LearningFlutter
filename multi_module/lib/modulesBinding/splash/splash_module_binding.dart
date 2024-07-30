import 'package:datasource/repository/initialConfig/initial_config_mock_repository.dart';
import 'package:domain/repository/initialConfig/initial_config_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/features/login/auth_presenter.dart';
import 'package:presentation/features/splash/splash_presenter.dart';

class SplashModuleBinding {
  static void init() {
    debugPrint('splash module start');

    GetIt.I.registerLazySingleton<InitialConfigRepository>(
      () => InitialConfigMockRepository(),
      dispose: (instance) {
        debugPrint('$instance disposed');
      },
    );

    GetIt.I.registerFactory(
      () => SplashPresenter(
        repository: GetIt.I.get(),
        authPresenter: AuthPresenter(),
      ),
    );
  }
}
