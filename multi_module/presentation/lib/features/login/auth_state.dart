class AuthState {
  const AuthState({this.userToken});

  final String? userToken;

  AuthState copyWith({
    String? userToken,
  }) {
    return AuthState(userToken: userToken);
  }
}
