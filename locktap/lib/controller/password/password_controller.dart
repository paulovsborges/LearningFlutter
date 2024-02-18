import 'package:bloc/bloc.dart';

class PasswordController extends Cubit<PasswordState> {
  PasswordController()
      : super(PasswordState(
          step: PasswordStep.create,
          createdPassword: '',
          isCreatedPasswordValid: false,
        ));

  void updateStep(PasswordStep newStep) {
    emit(state.copy(step: newStep));
  }

  void goToRepeatPassword(String password) {
    emit(state.copy(step: PasswordStep.repeat, createdPassword: password));
  }

  void validateCreatedPassword(String repeatedPassword) {
    var createdPassword = state.createdPassword;

    var isCreatedPasswordValid = createdPassword == repeatedPassword;

    if (isCreatedPasswordValid) {
      emit(state.copy(step: PasswordStep.enter));
    } else {
      emit(state.copy(isCreatedPasswordValid: isCreatedPasswordValid));
    }
  }
}

class PasswordState {
  PasswordState({
    required this.step,
    required this.createdPassword,
    required this.isCreatedPasswordValid,
  });

  final PasswordStep step;
  final String createdPassword;
  final bool isCreatedPasswordValid;

  PasswordState copy(
      {PasswordStep? step = null,
      String? createdPassword = null,
      bool? isCreatedPasswordValid = null}) {
    return PasswordState(
      step: step ?? this.step,
      createdPassword: createdPassword ?? this.createdPassword,
      isCreatedPasswordValid:
          isCreatedPasswordValid ?? this.isCreatedPasswordValid,
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
