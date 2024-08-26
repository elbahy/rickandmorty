import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/utils/app_colors.dart';
import 'package:rickandmorty/features/characters/business_logic/cubit/cubit/characters_cubit.dart';
import 'package:rickandmorty/features/characters/business_logic/cubit/cubit/characters_state.dart';
import 'package:rickandmorty/features/characters/presentation/widgets/character_item_widget.dart';

class CharactersHomeView extends StatelessWidget {
  const CharactersHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.greyColor,
        title: const Text(
          "Characters",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
        if (state is CharactersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CharactersLoaded) {
          return Expanded(
            child: GridView.builder(
                itemCount: state.characters.results.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return CharacterItemWidget(
                    characterModel: state.characters.results[index],
                  );
                }),
          );
        } else {
          return const Text('Something went wrong');
        }
      }),
    );
  }
}
