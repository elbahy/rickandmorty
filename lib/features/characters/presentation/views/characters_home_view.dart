import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:rickandmorty/core/utils/app_colors.dart';
import 'package:rickandmorty/features/characters/business_logic/cubit/cubit/characters_cubit.dart';
import 'package:rickandmorty/features/characters/business_logic/cubit/cubit/characters_state.dart';
import 'package:rickandmorty/features/characters/presentation/widgets/character_item_widget.dart';
import 'package:rickandmorty/features/characters/presentation/widgets/custome_app_bar.dart';
import 'package:rickandmorty/features/characters/presentation/widgets/no_connection_widget.dart';

class CharactersHomeView extends StatelessWidget {
  const CharactersHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    int pageNo = 1;
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      return Scaffold(
          backgroundColor: AppColors.blackColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(pageNo: ++pageNo),
          ),
          body: OfflineBuilder(
              connectivityBuilder: (
                BuildContext context,
                List<ConnectivityResult> connectivity,
                Widget child,
              ) {
                final bool connected =
                    !connectivity.contains(ConnectivityResult.none);
                if (!connected) {
                  return const NoConnectionWidget();
                }
                return child;
              },
              child: state is CharactersLoading
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
                      : const Text(
                          'Something went wrong',
                          style: TextStyle(color: Colors.white),
                        )));
    });
  }
}
