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
