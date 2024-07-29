

abstract class LoginUseCase {
  Future<String> execute(
    String eMail,
    String password,
  );
}
