import 'package:locktap/model/userData/user_data.dart';

abstract class LocalStorageRepository {
  Future<void> saveData(UserData userData);

  Future<String?> getData();
}
