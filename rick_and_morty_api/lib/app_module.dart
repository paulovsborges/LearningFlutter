import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_api/presentation/screens/characters_list/characters_list_cubit.dart';

import 'datasource/repository/rick_and_morty_repository.dart';

class AppModuleInitializer {
  AppModuleInitializer() {
    _initialize();
  }

  void _initialize() {
    GetIt.I.registerSingleton(RickAndMortyRepository());
    GetIt.I.registerSingleton(CharactersListCubit(repository: GetIt.I.get()));
  }
}
