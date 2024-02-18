import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../util/app_colors.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  static const valueKey = ValueKey('PasswordScreen');

  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.secondaryBackground, child: AppBar(),);
  }
}
