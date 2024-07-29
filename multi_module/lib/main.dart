import 'package:flutter/material.dart';
import 'package:multi_module/main_widget.dart';
import 'package:presentation/app_module.dart';
import 'package:presentation/features/navigation/n_cage_navigation_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppModule.initAllModules();
  NCageNavigationHelper.instance;
  runApp(const MainWidget());
}