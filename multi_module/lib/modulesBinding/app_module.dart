import 'package:multi_module/modulesBinding/auth/auth_module_binding.dart';
import 'package:multi_module/modulesBinding/details/details_module_binding.dart';
import 'package:multi_module/modulesBinding/splash/splash_module_binding.dart';

class AppModule {
  static void initAllModules() {
    SplashModuleBinding.init();
    AuthModuleBinding.init();
    DetailsModuleBinding.init();
  }
}
