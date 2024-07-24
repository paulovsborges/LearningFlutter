import 'package:domain/repository/initialConfig/initial_config_repository.dart';

class InitialConfigMockRepository implements InitialConfigRepository {
  @override
  Future<void> fetchInitialConfig() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
