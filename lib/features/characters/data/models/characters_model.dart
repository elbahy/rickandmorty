class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final Map<String, dynamic> location;
  final String image;
  final List<dynamic> episode;
  final String url;

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      location: json['location'],
      image: json['image'],
      episode: json['episode'],
      url: json['url'],
    );
  }

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
  });
}
