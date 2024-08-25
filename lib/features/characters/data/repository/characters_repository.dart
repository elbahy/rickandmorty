import 'package:dio/dio.dart';
import 'package:rickandmorty/core/services/web_service/api_constants.dart';
import 'package:rickandmorty/core/services/web_service/api_service.dart';
import 'package:rickandmorty/features/characters/data/models/characters_model.dart';

class CharactersRepository {
  final ApiService _apiService = ApiService(dio: Dio());
  late CharacterModel characters;
  Future<CharacterModel> getCharacters() async {
    await _apiService.getData(ApiConstants.characterEndpoint).then((value) {
      characters = CharacterModel.fromJson(value);
    });
    return characters;
  }
}
