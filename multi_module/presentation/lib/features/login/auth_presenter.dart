import 'package:bloc/bloc.dart';
import 'package:presentation/features/login/auth_state.dart';

class AuthPresenter extends Cubit<AuthState> {
  AuthPresenter() : super(const AuthState());

  void injectUserToken(String token) {
    emit(state.copyWith(userToken: token));
  }
}
