import 'package:flutter/material.dart';
import 'package:rickandmorty/core/routing/app_routes.dart';
import 'package:rickandmorty/core/utils/app_colors.dart';
import 'package:rickandmorty/features/characters/data/models/characters_model.dart';

class CharacterItemWidget extends StatelessWidget {
  const CharacterItemWidget({
    super.key,
    required this.characterModel,
  });

  final CharacterModel characterModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.detailsScreen,
            arguments: characterModel);
      },
      child: GridTile(
        footer: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          color: AppColors.greyColor.withOpacity(.8),
          alignment: Alignment.center,
          child: Text(
            characterModel.name,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child: Hero(
          tag: characterModel.id,
          child: Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                image: characterModel.image),
          ),
        ),
      ),
    );
  }
}
