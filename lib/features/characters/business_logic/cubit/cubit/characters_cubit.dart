import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/features/characters/business_logic/cubit/cubit/characters_state.dart';
import 'package:rickandmorty/features/characters/data/models/characters_model.dart';
import 'package:rickandmorty/features/characters/data/repository/characters_repository.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit({required this.charactersRepository})
      : super(CharactersInitial());

  static CharactersCubit get(context) =>
      BlocProvider.of<CharactersCubit>(context);
  final CharactersRepository charactersRepository;
  late List<CharacterModel> _characters;
  late List<CharacterModel> _searchCharacters;
  static bool _isSearch = false;
  static String _searchValue = '';
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

  bool get isSearch => _isSearch;
  set isSearch(bool value) {
    _isSearch = value;
    emit(CharactersLoaded(characters: _characters));
  }

  set searchValue(String value) {
    _searchValue = value;
    _searchCharacters = _characters.where((e) {
      return e.name.toLowerCase().contains(_searchValue.toLowerCase());
    }).toList();
    emit(CharactersLoaded(characters: _searchCharacters));
  }
}
