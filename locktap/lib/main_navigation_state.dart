import 'package:bloc/bloc.dart';

class MainNavigationState extends Cubit<AppScreens> {
  MainNavigationState() : super(OnBoarding());

  void goToScreen(AppScreens nextScreen) {
    emit(nextScreen);
  }
}

abstract class AppScreens {}

class OnBoarding extends AppScreens {}

class Password extends AppScreens {}
