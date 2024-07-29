import 'package:domain/repository/user/user_repository.dart';
import 'package:domain/useCase/registerUser/register_user_use_case.dart';

class RegisterUser implements RegisterUserUseCase {
  const RegisterUser({
    required this.registerUserRepository,
  });

  final UserRepository registerUserRepository;

  @override
  void execute(String name, String eMail) {


  }
}