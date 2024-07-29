import 'package:domain/repository/initialConfig/initial_config_repository.dart';
import 'package:uuid/uuid.dart';

class InitialConfigMockRepository implements InitialConfigRepository{
  @override
  Future<String> fetchInitialConfig() async {
    await Future.delayed(const Duration(seconds: 2));

    return const Uuid().v4();
  }
}