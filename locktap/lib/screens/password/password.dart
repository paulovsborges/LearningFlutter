import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locktap/util/components/primary_text.dart';
import 'package:locktap/util/components/secondary_text.dart';

import '../../util/app_style.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  static const valueKey = ValueKey('PasswordScreen');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.secondaryBackground,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 110,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      PrimaryText(
                        label: 'Create password',
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      SecondaryText(
                        description: 'Create a four-digit password',
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
