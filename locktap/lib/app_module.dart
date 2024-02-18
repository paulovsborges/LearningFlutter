import 'package:get_it/get_it.dart';

import 'main_navigation_state.dart';

class AppModule {
  AppModule() {
    _initialize();
  }

  void _initialize() {
    GetIt.I.registerSingleton(MainNavigationState());
  }
}
