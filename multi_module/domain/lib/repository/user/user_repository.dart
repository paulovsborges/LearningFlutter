import 'package:domain/entity/user_profile_entity.dart';

abstract class UserRepository{
  Future<void> registerUser(UserProfileEntity user);
  Future<void> deleteUser();
  Future<void> getUsers();
}