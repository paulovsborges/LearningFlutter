import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_module/app_binding.dart';
import 'package:presentation/features/navigation/app_router.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key, required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return AppBinding(
      child: MaterialApp(
        home: AppRouter(router: router),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
