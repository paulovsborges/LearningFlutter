import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_module/main_widget.dart';
import 'package:presentation/app_module.dart';
import 'package:presentation/app_router.dart';
import 'package:presentation/features/home/home_page.dart';
import 'package:presentation/features/navigation/bottom_nav_module.dart';
import 'package:presentation/features/splash/splash_module.dart';
import 'package:presentation/features/splash/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppModule.initAllModules();
  CustomNavigationHelper.instance;
  runApp(const MainWidget());
}