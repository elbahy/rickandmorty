import 'package:flutter/material.dart';
import 'package:rickandmorty/core/routing/app_rounting.dart';
import 'package:rickandmorty/core/routing/app_routes.dart';

void main() {
  runApp(const RickAndMortyApp());
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Rick and Morty',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      initialRoute: AppRoutes.charactersScreen,
    );
  }
}
