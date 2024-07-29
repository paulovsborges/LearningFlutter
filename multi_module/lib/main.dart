import 'package:flutter/material.dart';
import 'package:multi_module/main_widget.dart';
import 'package:multi_module/modulesBinding/splash/app_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppModule.initAllModules();
  runApp(const MainWidget());
}