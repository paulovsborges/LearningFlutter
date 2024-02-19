import 'package:get_it/get_it.dart';
import 'package:locktap/controller/password/password_controller.dart';
import 'package:locktap/repository/localStorageRepository/local_storage_repository.dart';
import 'package:locktap/repository/localStorageRepository/local_storage_shared_preferences_repository.dart';

import 'controller/main_navigation_controller.dart';

class AppModule {
  AppModule() {
    _initialize();
  }

  void _initialize() {
    _initDataModules();

    GetIt.I.registerSingleton(MainNavigationController());
    GetIt.I.registerSingleton(
      PasswordController(localStorageRepository: GetIt.I.get()),
    );
  }

  void _initDataModules() {
    GetIt.I.registerSingleton<LocalStorageRepository>(
      LocalStorageSharedPreferencesRepository(),
    );
  }
}
