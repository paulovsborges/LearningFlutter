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

  final String t =
      """'{"name": "John", "age": 30, "email": "john@example.com", "results" : [ {"id" : 1, "name" : "john doe"}]}'""";

// factory RickAndMortyDTO.fromJson(Map<String, dynamic> json) {
//   return switch (json) {
//     {'results': List<RickAndMortyResultDTO> results} => RickAndMortyDTO(
//         results: results,
//       ),
//     _ => throw const FormatException('Failed to parse'),
//   };
// }
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
    return RickAndMortyResultDTO(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      gender: json['gender'],
      image: json['image'],
    );
  }
}
