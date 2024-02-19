import 'package:bloc/bloc.dart';

class MainNavigationController extends Cubit<AppScreensState> {
  MainNavigationController() : super(PasswordScreenState());

  void goToScreen(AppScreensState nextScreen) {
    emit(nextScreen);
  }
}

abstract class AppScreensState {}

class OnBoardingScreenState extends AppScreensState {}

class PasswordScreenState extends AppScreensState {}

class HomeScreenState extends AppScreensState {}
