import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/components/animation/animation_configuration.dart';
import 'package:game_wiki_app/core/components/animation/fade_animation.dart';
import 'package:game_wiki_app/core/components/animation/scale_animation.dart';
import 'package:game_wiki_app/modules/game_library/presenter/cubit/game_library_cubit.dart';
import 'package:game_wiki_app/modules/game_library/presenter/widgets/library_card.dart';

class LibraryList extends StatelessWidget {
  const LibraryList({
    super.key,
    required this.cubit,
    required this.size,
    required this.index,
  });

  final GameLibraryCubit cubit;
  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      position: index,
      duration: const Duration(milliseconds: 375),
      columnCount: 2,
      child: ScaleAnimation(
        child: FadeInAnimation(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LibraryCard(
                  model: cubit.listGames[index],
                  size: size,
                  image: cubit.listGames[index].backgroundImage,
                  title: cubit.listGames[index].name,
                  rating: cubit.listGames[index].rating)),
        ),
      ),
    );
  }
}
