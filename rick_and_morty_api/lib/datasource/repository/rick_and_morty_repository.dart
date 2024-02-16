import 'package:rick_and_morty_api/datasource/service/rick_and_morty_api.dart';
import 'package:http/http.dart' as http;

class RickAndMortyRepository {
  // final RickAndMortyApi _api = RickAndMortyApi();

  final String baseUrl = "https://rickandmortyapi.com/api/";

  Future<http.Response> fetchCharacters(int offset ) async {

    var offsetParameter = '?page=$offset';

    return http.get(Uri.parse("${baseUrl}character/$offsetParameter"));

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
