import 'package:flutter/material.dart';

import '../app_style.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.label, required this.btnCallback});

  final String label;
  final VoidCallback btnCallback;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(
        Radius.circular(30),
      ),
      color: AppColors.lightBlue,
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        splashColor: AppColors.backgroundColor.withOpacity(0.2),
        onTap: btnCallback,
        child: Container(
          height: 52,
          width: 335,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            color: Colors.transparent,
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'sf',
                  fontWeight: FontWeight.w100,
                  fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
