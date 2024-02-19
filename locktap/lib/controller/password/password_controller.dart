import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class PasswordController extends Cubit<PasswordState> {
  PasswordController()
      : super(PasswordState(
          step: PasswordStep.create,
          createdPassword: '',
          isCreatedPasswordValid: true,
          focusNode: FocusNode(),
          textEditingController: TextEditingController(),
          lastFilledIndex: 0,
        ));

  void updateStep(PasswordStep newStep) {
    emit(state.copy(step: newStep));
  }

  void goToRepeatPassword(String password) {
    emit(state.copy(
      step: PasswordStep.repeat,
      lastFilledIndex: 0,
      textEditingController: state.textEditingController..clear(),
      createdPassword: password
    ));
  }

  void validateCreatedPassword(String repeatedPassword) {
    var createdPassword = state.createdPassword;

    var isCreatedPasswordValid = createdPassword == repeatedPassword;

    if (isCreatedPasswordValid) {
      emit(state.copy(step: PasswordStep.enter, lastFilledIndex: 0));
    } else {
      emit(state.copy(isCreatedPasswordValid: isCreatedPasswordValid));
    }
  }

  void onPasswordChanged(String text) {
    if (text.length == 4) {
      switch (state.step) {
        case PasswordStep.create:
          goToRepeatPassword(text);
        case PasswordStep.repeat:
          validateCreatedPassword(text);
        case PasswordStep.enter:
      }
    } else {
      emit(state.copy(lastFilledIndex: text.length));
    }
  }

  void dismissNodeFocus() {
    state.focusNode.unfocus();
    emit(state);
  }

  void onRequestFocus() {
    // state.focusNode.requestFocus();
    emit(state);
  }
}

class PasswordState {
  PasswordState({
    required this.step,
    required this.createdPassword,
    required this.isCreatedPasswordValid,
    required this.focusNode,
    required this.textEditingController,
    required this.lastFilledIndex,
  });

  final PasswordStep step;
  final String createdPassword;
  final bool isCreatedPasswordValid;
  final FocusNode focusNode;
  final TextEditingController textEditingController;

  final int lastFilledIndex;

  PasswordState copy({
    PasswordStep? step = null,
    String? createdPassword = null,
    bool? isCreatedPasswordValid = null,
    FocusNode? focusNode = null,
    TextEditingController? textEditingController = null,
    int? lastFilledIndex = null,
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
