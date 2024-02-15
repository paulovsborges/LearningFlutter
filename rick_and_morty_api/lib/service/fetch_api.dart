import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty_api/character.dart';

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

class RickAndMortyDTO {
  RickAndMortyDTO({required this.results});

  final List<RickAndMortyResultDTO> results;

  factory RickAndMortyDTO.fromJson(Map<String, dynamic> json) {
    var results = json['results'] as List;

    var characters = results.map((e) => RickAndMortyResultDTO.fromJson(e));

    return RickAndMortyDTO(results: characters.toList());
  }
}

class RickAndMortyResultDTO {
  const RickAndMortyResultDTO({
    required this.id,
    required this.name,
    required this.status,
    required this.gender,
    required this.image,
  });

  final int id;
  final String name;
  final String status;
  final String gender;
  final String image;

  factory RickAndMortyResultDTO.fromJson(Map<String, dynamic> json) {
    var charactersName = json['name'] as String;

    if (charactersName.length > 15) {
      try {
        charactersName =
            charactersName.replaceRange(15, charactersName.length, '...');
      } catch (e) {}
    }

    return RickAndMortyResultDTO(
      id: json['id'],
      name: charactersName,
      status: json['status'],
      gender: json['gender'],
      image: json['image'],
    );
  }
}
