import 'package:flutter/material.dart';
import 'package:multi_module/main_widget.dart';
import 'package:presentation/features/splash/splash_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SplashModule.startModules();

  runApp(const MainWidget());
}