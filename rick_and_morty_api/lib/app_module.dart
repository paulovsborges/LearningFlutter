import 'package:flutter_modular/flutter_modular.dart';
import 'package:rick_and_morty_api/presentation/screens/characters_list/characters_list_state.dart';

import 'datasource/repository/rick_and_morty_repository.dart';
import 'main.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(RickAndMortyRepository.new);
    i.addSingleton(CharactersListCubit.new,
        key: CharactersListCubit.valueKey.value);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const MyHomePage(),
    );
  }
}
