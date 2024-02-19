import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:locktap/controller/password/password_controller.dart';
import 'package:locktap/screens/password/password_text_field.dart';
import 'package:locktap/util/components/primary_text.dart';
import 'package:locktap/util/components/secondary_text.dart';

import '../../controller/password/password_state.dart';
import '../../util/app_style.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  static const valueKey = ValueKey('PasswordScreen');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<PasswordController>(),
      child: BlocBuilder<PasswordController, PasswordState>(
        builder: (context, state) {
          return _PasswordScreen(
            state: state,
          );
        },
      ),
    );
  }
}

class _PasswordScreen extends StatelessWidget {
  const _PasswordScreen({super.key, required this.state});

  final PasswordState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.secondaryBackground,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 110,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      PrimaryText(
                        label: state.step.title,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SecondaryText(
                        description: state.step.subtitle,
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      PasswordTextField(
                        passwordState: state,
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
