import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/services/web_service/api_constants.dart';
import 'package:rickandmorty/core/utils/app_colors.dart';
import 'package:rickandmorty/features/characters/business_logic/cubit/cubit/characters_cubit.dart';
import 'package:rickandmorty/features/characters/business_logic/cubit/cubit/characters_state.dart';
import 'package:rickandmorty/features/characters/presentation/widgets/character_item_widget.dart';

class CharactersHomeView extends StatelessWidget {
  const CharactersHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    int pageNo = 1;
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColors.blackColor,
        appBar: AppBar(
          backgroundColor: AppColors.greyColor,
          title: CharactersCubit.get(context).isSearch
              ? TextField(
                  cursorColor: AppColors.whiteColor,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: AppColors.whiteColor),
                  ),
                  style: const TextStyle(color: AppColors.whiteColor),
                  onChanged: (value) {
                    CharactersCubit.get(context).searchValue = value;
                  },
                )
              : const Text(
                  "Characters",
                  style: TextStyle(color: Colors.white),
                ),
          actions: [
            IconButton(
              onPressed: () {
                CharactersCubit.get(context).isSearch =
                    !CharactersCubit.get(context).isSearch;
              },
              icon: Icon(
                CharactersCubit.get(context).isSearch
                    ? Icons.close
                    : Icons.search,
                color: AppColors.whiteColor,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.play_arrow_rounded),
              onPressed: () {
                CharactersCubit.get(context)
                    .getCharacters('/character/?page=${++pageNo}');
              },
            )
          ],
          leading: CharactersCubit.get(context).isSearch
              ? IconButton(
                  onPressed: () {
                    CharactersCubit.get(context).isSearch = false;
                  },
                  icon: const Icon(Icons.arrow_back_ios,
                      color: AppColors.whiteColor),
                )
              : Container(),
        ),
        body: state is CharactersLoading
            ? const Center(
                child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ))
            : state is CharactersLoaded
                ? Expanded(
                    child: GridView.builder(
                      itemCount: state.characters.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return CharacterItemWidget(
                          characterModel: state.characters[index],
                        );
                      },
                    ),
                  )
                : const Text('Something went wrong'),
      );
    });
  }
}
