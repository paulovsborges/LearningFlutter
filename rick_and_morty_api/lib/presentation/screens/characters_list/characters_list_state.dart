import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_api/datasource/repository/rick_and_morty_repository.dart';

import '../../../datasource/dto/rick_and_morty_dto.dart';
import '../../../domain/entity/character.dart';
import '../../../domain/entity/data_state.dart';

class CharactersListCubit extends Cubit<DataState> {

  static const valueKey = ValueKey('CharactersListCubit');

  CharactersListCubit({required this.repository}) : super(InitialState()) {
    _getCharacters();
  }

  final RickAndMortyRepository repository;

  void _getCharacters() async {
    emit(LoadingState());

    await Future.delayed(const Duration(seconds: 5));

    try {
      var response = await repository.fetchCharacters();

      Map<String, dynamic> decoded = jsonDecode(response.body);

      var results = RickAndMortyDTO.fromJson(decoded);

      var entities = results.results.map((e) => _mapToEntity(e));

      emit(Success(data: entities.toList()));
    } catch (e) {
      emit(ErrorState());
    }
  }

  Character _mapToEntity(RickAndMortyResultDTO dto) {
    return Character(
        name: dto.name,
        image: dto.image,
        status: dto.status,
        gender: dto.gender);
  }
}
