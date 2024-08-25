import 'package:flutter/material.dart';
import 'package:rickandmorty/core/routing/app_routes.dart';
import 'package:rickandmorty/features/characters/presentation/views/characters_details_view.dart';
import 'package:rickandmorty/features/characters/presentation/views/characters_home_view.dart';

Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.charactersScreen:
      return MaterialPageRoute(builder: (_) => const CharactersHomeView());
    case AppRoutes.detailsScreen:
      return MaterialPageRoute(builder: (_) => const CharactersDetailsView());
    default:
      return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Screen Not Found !"))));
  }
}
