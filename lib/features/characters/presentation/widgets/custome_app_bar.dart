import 'package:flutter/material.dart';
import 'package:rickandmorty/core/utils/app_colors.dart';
import 'package:rickandmorty/features/characters/business_logic/cubit/cubit/characters_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.pageNo,
  });
  final int pageNo;
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            CharactersCubit.get(context).isSearch ? Icons.close : Icons.search,
            color: AppColors.whiteColor,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.play_arrow_rounded),
          onPressed: () {
            CharactersCubit.get(context)
                .getCharacters('/character/?page=$pageNo');
          },
        )
      ],
      leading: CharactersCubit.get(context).isSearch
          ? IconButton(
              onPressed: () {
                CharactersCubit.get(context).isSearch = false;
              },
              icon:
                  const Icon(Icons.arrow_back_ios, color: AppColors.whiteColor),
            )
          : Container(),
    );
  }
}
