import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/routing/app_routes.dart';
import 'package:rickandmorty/core/services/web_service/api_constants.dart';
import 'package:rickandmorty/features/characters/business_logic/cubit/cubit/characters_cubit.dart';
import 'package:rickandmorty/features/characters/data/models/characters_model.dart';
import 'package:rickandmorty/features/characters/data/repository/characters_repository.dart';
import 'package:rickandmorty/features/characters/presentation/views/characters_details_view.dart';
import 'package:rickandmorty/features/characters/presentation/views/characters_home_view.dart';

CharactersRepository charactersRepository = CharactersRepository();
Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.charactersScreen:
      return MaterialPageRoute(
          builder: (_) => BlocProvider(
                create: (context) =>
                    CharactersCubit(charactersRepository: charactersRepository)
                      ..getCharacters(ApiConstants.characterEndpoint),
                child: const CharactersHomeView(),
              ));
    case AppRoutes.detailsScreen:
      final character = settings.arguments as CharacterModel;
      return MaterialPageRoute(
          builder: (_) => CharactersDetailsView(character: character));
    default:
      return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Screen Not Found !"))));
  }
}
