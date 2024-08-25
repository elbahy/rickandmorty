import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/features/characters/business_logic/cubit/cubit/characters_state.dart';
import 'package:rickandmorty/features/characters/data/models/characters_model.dart';
import 'package:rickandmorty/features/characters/data/repository/characters_repository.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit({required this.charactersRepository})
      : super(CharactersInitial());

  final CharactersRepository charactersRepository;
  late CharacterModel _characters;
  void getCharacters() {
    try {
      emit(CharactersLoading());

      charactersRepository.getCharacters().then((characters) {
        _characters = characters;
        emit(CharactersLoaded(characters: _characters));
      });
    } on Exception catch (e) {
      emit(CharactersError(message: e.toString()));
    }
  }
}
