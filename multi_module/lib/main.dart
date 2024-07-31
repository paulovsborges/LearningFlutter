import 'package:datasource/http_engine.dart';
import 'package:flutter/material.dart';
import 'package:multi_module/main_widget.dart';
import 'package:multi_module/modulesBinding/app_module.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  AppModule.initAllModules();

  final response = await HttpEngine().test(
    endpoint: '/api/character',
    queryParameters: {
      'name': 'morty',
      'status': 'dead',
    },
  );

  debugPrint(response.data);
  runApp(const MainWidget());
}
