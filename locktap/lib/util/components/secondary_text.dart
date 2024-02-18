import 'package:flutter/cupertino.dart';

import '../app_style.dart';

class SecondaryText extends StatelessWidget {
  const SecondaryText({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(
        color: AppColors.gray,
        fontFamily: 'sf',
        fontWeight: FontWeight.w100,
        fontSize: 16,
      ),
      textAlign: TextAlign.center,
    );
  }
}
