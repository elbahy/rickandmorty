import 'package:rickandmorty/features/characters/data/models/characters_model.dart';

abstract class CharactersState {}

final class CharactersInitial extends CharactersState {}

final class CharactersLoading extends CharactersState {}

final class CharactersLoaded extends CharactersState {
  final List<CharacterModel> characters;

  CharactersLoaded({required this.characters});
}

final class CharactersError extends CharactersState {
  final String message;

  CharactersError({required this.message});
}
