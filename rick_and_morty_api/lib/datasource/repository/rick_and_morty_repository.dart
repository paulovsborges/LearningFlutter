import 'package:http/http.dart' as http;

class RickAndMortyRepository {

  final String baseUrl = 'rickandmortyapi.com';

  Future<http.Response> fetchCharacters(int offset) async {
    var queryParameters = {
      'page': offset.toString(),
    };

    const endpoint = '/api/character';

    final uri = Uri.https(baseUrl, endpoint, queryParameters);

    return http.get(uri);
  }
}
