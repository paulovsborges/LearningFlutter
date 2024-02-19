import 'package:shared_preferences/shared_preferences.dart';

import '../../model/userData/user_data.dart';
import 'local_storage_repository.dart';

class LocalStorageSharedPreferencesRepository extends LocalStorageRepository {
  LocalStorageSharedPreferencesRepository() {
    _initPreferences();
  }

  static const String _dataKey = 'UserDataKey';

  void _initPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }

  late SharedPreferences preferences;

  @override
  Future<void> saveData(UserData userData) async {
    await preferences.setString(_dataKey, 'testing data');
  }

  @override
  Future<String?> getData() async {
    return preferences.getString(_dataKey);
  }
}
