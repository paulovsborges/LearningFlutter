import 'package:datasource/repository/initialConfig/initial_config_mock_repository.dart';
import 'package:domain/repository/initialConfig/initial_config_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/features/splash/splash_presenter.dart';

class SplashModuleBinding {
  static void startModules() {
    debugPrint('splash module start');

    GetIt.I.registerLazySingleton<InitialConfigRepository>(
      () => InitialConfigMockRepository(),
      dispose: (instance) {
        debugPrint('$instance disposed');
      },
    );

    GetIt.I.registerLazySingleton<SplashPresenter>(
      () => SplashPresenter(
        repository: GetIt.I.get(),
      ),
      dispose: (instance) {
        debugPrint('$instance disposed');
      },
    );
  }
}
