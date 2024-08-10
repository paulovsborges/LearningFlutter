import 'package:flutter/material.dart';
import 'package:presentation/features/search/filter_cell.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  static const String routeName = '/search_name';

  final List<String> filters = [
    'Moda infantil',
    'Moda adulto',
    'Saias',
    'Moda feminina',
    'Vestidos',
    'Blusas',
    'Calças',
    'Camisetas',
    'Bermudas',
    'Blusão',
    'Cropped',
    'Verão',
    'Inverno',
    'Inverno / verão',
    'Outono',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [FilterCell(label: filters.first)],
      ),
    );
  }
}
