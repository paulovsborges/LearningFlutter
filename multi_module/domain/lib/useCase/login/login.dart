import 'package:domain/repository/auth/auth_repository.dart';
import 'package:domain/repository/user/user_repository.dart';
import 'package:domain/useCase/login/login_use_case.dart';

class Login implements LoginUseCase {
  const Login({
    required this.userRepository,
    required this.authRepository,
  });

  final UserRepository userRepository;
  final AuthRepository authRepository;

  @override
  Future<String> execute(String eMail, String password) async {
    return await authRepository.login(eMail, password);
  }
}
