class RickAndMortyDTO {
  RickAndMortyDTO({required this.results, required this.info});

  final RickAndMortyInfoDTO info;
  final List<RickAndMortyResultDTO> results;

  factory RickAndMortyDTO.fromJson(Map<String, dynamic> json) {
    var results = json['results'] as List;
    var info = json['info'];

    var characters = results.map((e) => RickAndMortyResultDTO.fromJson(e));
    var infoDto = RickAndMortyInfoDTO.fromJson(info);
    return RickAndMortyDTO(info: infoDto, results: characters.toList());
  }
}

class RickAndMortyInfoDTO {
  RickAndMortyInfoDTO({required this.pages});

  final int pages;

  factory RickAndMortyInfoDTO.fromJson(Map<String, dynamic> json) {
    return RickAndMortyInfoDTO(pages: json['pages']);
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
    return RickAndMortyResultDTO(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      gender: json['gender'],
      image: json['image'],
    );
  }
}
