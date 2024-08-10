import 'package:flutter/material.dart';

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
        children: [
          _buildCell(filters.first)
        ],
      ),
    );
  }

  Widget _buildCell(String label) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        child: Text(label),
      ),
    );
  }
}
