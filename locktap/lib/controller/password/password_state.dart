
import 'package:flutter/cupertino.dart';

class PasswordState {
  PasswordState({
    required this.step,
    required this.createdPassword,
    required this.isCreatedPasswordValid,
    required this.focusNode,
    required this.textEditingController,
    required this.lastFilledIndex,
    required this.borderColor,
  });

  final PasswordStep step;
  final String createdPassword;
  final bool isCreatedPasswordValid;
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final Color borderColor;

  final int lastFilledIndex;

  PasswordState copy({
    PasswordStep? step = null,
    String? createdPassword = null,
    bool? isCreatedPasswordValid = null,
    FocusNode? focusNode = null,
    TextEditingController? textEditingController = null,
    int? lastFilledIndex = null,
    Color? borderColor = null,
  }) {
    return PasswordState(
      step: step ?? this.step,
      createdPassword: createdPassword ?? this.createdPassword,
      isCreatedPasswordValid:
      isCreatedPasswordValid ?? this.isCreatedPasswordValid,
      focusNode: focusNode ?? this.focusNode,
      textEditingController:
      textEditingController ?? this.textEditingController,
      lastFilledIndex: lastFilledIndex ?? this.lastFilledIndex,
      borderColor: borderColor ?? this.borderColor,
    );
  }
}

enum PasswordStep {
  create(title: 'Create password', subtitle: 'Create a four-digit password'),
  repeat(title: 'Repeat password', subtitle: 'Enter your invented password'),
  enter(title: 'Enter password', subtitle: 'Enter password to login');

  const PasswordStep({required this.title, required this.subtitle});

  final String title;
  final String subtitle;
}

