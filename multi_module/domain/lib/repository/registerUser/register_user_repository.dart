abstract class RegisterUserRepository{
  Future<void> registerUser();
  Future<void> deleteUser();
  Future<void> getUsers();
}