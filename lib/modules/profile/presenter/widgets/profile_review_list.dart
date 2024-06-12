import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/components/animation/animation_configuration.dart';
import 'package:game_wiki_app/core/components/animation/animation_limiter.dart';
import 'package:game_wiki_app/core/components/animation/fade_animation.dart';
import 'package:game_wiki_app/core/components/animation/scale_animation.dart';
import 'package:game_wiki_app/modules/profile/presenter/cubit/profile_cubit.dart';
import 'package:game_wiki_app/modules/profile/presenter/widgets/card_review.dart';

class ProfileListReview extends StatelessWidget {
  final ProfileCubit cubit;
  const ProfileListReview({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimationLimiter(
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 6 / 20,
          padding: const EdgeInsets.only(top: 30),
          shrinkWrap: true,
          crossAxisCount: 2,
          children: List.generate(
            cubit.list.length,
            (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 375),
                columnCount: 2,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: CardReview(
                        review: cubit.list[index], date: "20/04/2024"),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
