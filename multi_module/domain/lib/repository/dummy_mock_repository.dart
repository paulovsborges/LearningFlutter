import 'package:domain/repository/dummy_repository.dart';

class DummyMockRepository implements DummyRepository {

  @override
  Future<void> makeDummyRequest() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
