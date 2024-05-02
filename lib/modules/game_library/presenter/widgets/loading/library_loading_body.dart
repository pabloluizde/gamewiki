import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/components/animation/animation_configuration.dart';
import 'package:game_wiki_app/core/components/animation/fade_animation.dart';
import 'package:game_wiki_app/core/components/animation/scale_animation.dart';
import 'package:game_wiki_app/modules/game_library/presenter/widgets/loading/library_card_loading.dart';

class LibraryLoadingBody extends StatelessWidget {
  const LibraryLoadingBody({
    super.key,
    required this.size,
    required this.index,
  });

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
              child: LibraryCardLoading(
                size: size,
              )),
        ),
      ),
    );
  }
}
