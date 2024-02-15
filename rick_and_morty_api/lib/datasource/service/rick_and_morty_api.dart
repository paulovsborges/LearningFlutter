import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/entity/character.dart';
import '../dto/rick_and_morty_dto.dart';

class RickAndMortyApi {
  RickAndMortyApi();

  final String baseUrl = "https://rickandmortyapi.com/api/";

  Stream<List<Character>> fetchCharacters() async* {
    var response = await http.get(Uri.parse("${baseUrl}character"));

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> decoded = jsonDecode(response.body);

        var results = RickAndMortyDTO.fromJson(decoded);

        var entities = results.results.map((e) => _mapToEntity(e));

        yield entities.toList();
      }
    } catch (e) {
      print("Error $e");
      yield [];
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
