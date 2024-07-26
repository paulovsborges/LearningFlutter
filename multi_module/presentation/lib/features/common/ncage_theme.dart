import 'package:flutter/material.dart';
import 'package:presentation/features/common/ncage_colors.dart';

class NCageTheme {
  static ThemeData lightTheme() {
    final theme = ThemeData.light();
    return theme.copyWith(
      scaffoldBackgroundColor: NCageColors.whiteF7F7F8,
      primaryColor: NCageColors.green008A45,
      primaryTextTheme: theme.primaryTextTheme.copyWith(
        bodyLarge: TextStyle(
          color: NCageColors.black2D2E33,
          fontWeight: FontWeight.w700,
          fontSize: 32,
        ),
        displayMedium: TextStyle(
          color: NCageColors.black2D2E33,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        )
      ),
    );
  }
}
