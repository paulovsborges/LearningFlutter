import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:locktap/controller/password/password_state.dart';
import 'package:locktap/model/userData/user_data.dart';
import 'package:locktap/repository/localStorageRepository/local_storage_repository.dart';
import 'package:locktap/util/app_style.dart';

import '../main_navigation_controller.dart';

class PasswordController extends Cubit<PasswordState> {
  PasswordController({required this.localStorageRepository})
      : super(PasswordState(
          step: PasswordStep.create,
          createdPassword: '',
          isCreatedPasswordValid: true,
          focusNode: FocusNode(),
          textEditingController: TextEditingController(),
          lastFilledIndex: 0,
          borderColor: Colors.transparent,
        ));

  final LocalStorageRepository localStorageRepository;

  void updateStep(PasswordStep newStep) {
    emit(state.copy(step: newStep));
  }

  void _goToRepeatPassword(String password) {
    emit(state.copy(
        step: PasswordStep.repeat,
        lastFilledIndex: 0,
        textEditingController: state.textEditingController..clear(),
        createdPassword: password));
  }

  void _validateCreatedPassword(String repeatedPassword) {
    var createdPassword = state.createdPassword;

    var isCreatedPasswordValid = createdPassword == repeatedPassword;

    if (isCreatedPasswordValid) {
      emit(state.copy(
        step: PasswordStep.enter,
        lastFilledIndex: 0,
        textEditingController: state.textEditingController..clear(),
        borderColor: AppColors.lightBlue,
      ));
    } else {
      Color? borderColor;

      if (state.step == PasswordStep.repeat) {
        borderColor = AppColors.error;
      } else {
        borderColor = null;
      }
      emit(state.copy(
        isCreatedPasswordValid: isCreatedPasswordValid,
        borderColor: borderColor,
        lastFilledIndex: repeatedPassword.length,
      ));
    }
  }

  void onPasswordChanged(String text) {
    if (text.length == 4) {
      switch (state.step) {
        case PasswordStep.create:
          _goToRepeatPassword(text);
        case PasswordStep.repeat:
          _validateCreatedPassword(text);
        case PasswordStep.enter:
          _goToHome();
      }
    } else {
      emit(state.copy(lastFilledIndex: text.length));
    }
  }

  void dismissNodeFocus() {
    emit(state.copy(
      focusNode: state.focusNode..unfocus(),
      borderColor: Colors.transparent,
    ));
  }

  void onRequestFocus() {
    emit(state.copy(borderColor: AppColors.lightBlue));
  }

  void _goToHome() async {
    await localStorageRepository.saveData(UserData(
        createdPassword: 'createdPassword', hasAlreadySeenOnboarding: false));

    var testing = await localStorageRepository.getData();

    print("## data from preferences $testing");

    var controller = GetIt.I.get<MainNavigationController>();
    controller.goToScreen(HomeScreenState());
  }
}
