import 'package:flutter/material.dart';
import 'package:rickandmorty/core/utils/app_colors.dart';
import 'package:rickandmorty/features/characters/data/models/characters_model.dart';

class CharactersDetailsView extends StatelessWidget {
  const CharactersDetailsView({super.key, required this.character});

  final CharacterModel character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 600,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag: character.id,
              child: Image(
                image: NetworkImage(character.image),
                fit: BoxFit.cover,
              ),
            ),
            centerTitle: true,
            title: Container(
              height: 50,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              color: AppColors.greyColor.withOpacity(.8),
              alignment: Alignment.center,
              child: Text(
                character.name,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: Column(children: [])),
      ]),
    );
  }
}
