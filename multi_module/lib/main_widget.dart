import 'package:flutter/material.dart';
import 'package:multi_module/app_binding.dart';
import 'package:presentation/app_router.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  const AppBinding(
      child: MaterialApp(
        home: AppRouter(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
