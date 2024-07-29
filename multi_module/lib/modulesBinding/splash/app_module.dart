import 'package:multi_module/modulesBinding/auth/auth_module_binding.dart';
import 'package:multi_module/modulesBinding/splash_module_binding.dart';

class AppModule{
  static void initAllModules(){
    AuthModuleBinding.init();
    SplashModuleBinding.init();
  }
}