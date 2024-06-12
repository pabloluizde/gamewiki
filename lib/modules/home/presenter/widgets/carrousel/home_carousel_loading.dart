import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class HomeCarouselLoading extends StatelessWidget {
  const HomeCarouselLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColors.darkPurpleColor,
        highlightColor: const Color.fromARGB(152, 193, 193, 193),
        enabled: true,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 300,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: AppColors.darkPurpleColor,
                borderRadius: BorderRadius.circular(15)),
          ),
        ));
  }
}
