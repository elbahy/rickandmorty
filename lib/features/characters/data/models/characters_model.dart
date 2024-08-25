class CharacterModel {
  CharacterModel({
    required this.info,
    required this.results,
  });

  final Info info;
  final List<Result> results;

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      info: json["info"],
      results: json["results"],
    );
  }
}

class Info {
  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  final int count;
  final int pages;
  final String next;
  final dynamic prev;

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      count: json["count"],
      pages: json["pages"],
      next: json["next"],
      prev: json["prev"],
    );
  }
}

class Result {
  Result({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Location origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json["id"],
      name: json["name"],
      status: json["status"],
      species: json["species"],
      type: json["type"],
      gender: json["gender"],
      origin: json["origin"],
      location: json["location"],
      image: json["image"],
      episode: json["episode"],
      url: json["url"],
      created: DateTime.tryParse(json["created"])!,
    );
  }
}

class Location {
  Location({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json["name"],
      url: json["url"],
    );
  }
}
