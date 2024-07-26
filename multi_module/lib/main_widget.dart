import 'package:flutter/material.dart';
import 'package:multi_module/app_binding.dart';
import 'package:presentation/app_router.dart';
import 'package:presentation/features/common/ncage_theme.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBinding(
      child: MaterialApp(
        home: const AppRouter(),
        // theme: ZeusTheme.lightTheme(),
        // themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
