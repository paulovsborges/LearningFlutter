import 'package:flutter/material.dart';
import 'package:presentation/features/common/ncage_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none
        ),
        fillColor: NCageColors.whiteEDEEF0,
        filled: true,
        labelText: 'Search here',
        labelStyle: TextStyle(color: NCageColors.gray454F63),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: const Icon(Icons.search_rounded),
      ),
    );
  }
}
