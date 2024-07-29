import 'package:get_it/get_it.dart';
import 'package:presentation/features/login/auth_presenter.dart';

class AuthModuleBinding {
  static init() {
    GetIt.I.registerLazySingleton(() => AuthPresenter());
  }
}
