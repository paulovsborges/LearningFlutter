import 'package:flutter/material.dart';
import 'package:multi_module/app_binding.dart';
import 'package:presentation/features/navigation/app_router.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print('## build');
    return const AppBinding(
      child: MaterialApp(
        home: AppRouter(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
