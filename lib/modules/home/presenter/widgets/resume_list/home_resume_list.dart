import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/components/animation/animation_configuration.dart';
import 'package:game_wiki_app/core/components/animation/animation_limiter.dart';
import 'package:game_wiki_app/core/components/animation/fade_animation.dart';
import 'package:game_wiki_app/core/components/animation/scale_animation.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:game_wiki_app/core/components/card_defeault.dart';

class HomeResumeList extends StatelessWidget {
  const HomeResumeList({
    super.key,
    required this.cubit,
    required this.size,
  });

  final HomeCubit cubit;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
        child: GridView.count(
            scrollDirection: Axis.horizontal,
            childAspectRatio: 6 / 5,
            shrinkWrap: true,
            crossAxisCount: 1,
            children: List.generate(cubit.listGames.length, (int index) {
              return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  columnCount: 1,
                  child: ScaleAnimation(
                      child: FadeInAnimation(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 10),
                      child: CardDefeault(
                          model: cubit.listGames[index],
                          size: size,
                          image: cubit.listGames[index].backgroundImage,
                          title: cubit.listGames[index].name,
                          rating: cubit.listGames[index].rating),
                    ),
                  )));
            })));
  }
}
