import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty_api/domain/entity/data_state.dart';

import '../../domain/entity/character.dart';
import '../dto/rick_and_morty_dto.dart';

class RickAndMortyApi {
  RickAndMortyApi();

  final String baseUrl = "https://rickandmortyapi.com/api/";

  Future<http.Response> fetchCharacters() async {
    return http.get(Uri.parse("${baseUrl}character"));

    // try {
    //   if (response.statusCode == 200) {
    //     Map<String, dynamic> decoded = jsonDecode(response.body);
    //
    //     var results = RickAndMortyDTO.fromJson(decoded);
    //
    //     var entities = results.results.map((e) => _mapToEntity(e));
    //   }
    // } catch (e) {
    //   print("Error $e");
    // }
  }

}
