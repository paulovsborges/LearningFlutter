import 'package:flutter_modular/flutter_modular.dart';
import 'package:rick_and_morty_api/presentation/screens/character_details/character_details.dart';
import 'package:rick_and_morty_api/presentation/screens/characters_list/characters_list_cubit.dart';

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
      child: (_) => const MyHomePage(),
    );
    r.child(
      '${CharacterDetails.screenRoute}/${CharacterDetails.routeParameter}',
      child: (_) => CharacterDetails(
        characterId: r.args.params['id'],
      ),
    );
  }
}
