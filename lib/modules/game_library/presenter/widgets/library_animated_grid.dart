import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wiki_app/core/components/animation/animation_limiter.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/game_library/presenter/cubit/game_library_cubit.dart';
import 'package:game_wiki_app/modules/game_library/presenter/cubit/game_library_states.dart';
import 'package:game_wiki_app/modules/game_library/presenter/widgets/library_list.dart';
import 'package:game_wiki_app/modules/game_library/presenter/widgets/loading/library_loading_body.dart';

class LibraryAnimatedGrid extends StatelessWidget {
  const LibraryAnimatedGrid({
    super.key,
    required this.cubit,
    required this.size,
  });

  final GameLibraryCubit cubit;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          return AnimationLimiter(
            child: Material(
              color: AppColors.blackDefaultColor,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.darkPurpleColor,
                    borderRadius: BorderRadius.circular(10)),
                child: GridView.count(
                  childAspectRatio: (16 / 19),
                  padding: const EdgeInsets.only(top: 30),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: List.generate(
                    cubit.listGames.length,
                    (int index) {
                      if (state is GameLibraryLoadingState) {
                        return LibraryLoadingBody(
                          size: size,
                          index: index,
                        );
                      }
                      if (state is GameLibrarySuccessState) {
                        return LibraryList(
                          cubit: cubit,
                          size: size,
                          index: index,
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ),
            ),
          );
        });
  }
}
