import 'package:multi_module/modulesBinding/splash_module_binding.dart';

class AppModule{
  static void initAllModules(){
    SplashModuleBinding.startModules();
  }
}