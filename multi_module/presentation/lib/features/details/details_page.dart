import 'package:flutter/material.dart';
import 'package:presentation/features/navigation/n_cage_navigation_helper.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  static const String routeName = '/details_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: context.myRouterPop,
          child: const Text('Back'),
        ),
      ),
      body: const Center(
        child: Text('Details page'),
      ),
    );
  }
}
