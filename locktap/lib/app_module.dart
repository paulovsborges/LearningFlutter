import 'package:get_it/get_it.dart';
import 'package:locktap/controller/password/password_controller.dart';

import 'controller/main_navigation_controller.dart';

class AppModule {
  AppModule() {
    _initialize();
  }

  void _initialize() {
    GetIt.I.registerSingleton(MainNavigationController());
    GetIt.I.registerSingleton(PasswordController());
  }
}
