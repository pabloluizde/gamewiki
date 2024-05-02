import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/components/star_rating.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/core/entites/games/result_list_game_entite.dart';

class InformationTextRating extends StatelessWidget {
  const InformationTextRating({
    super.key,
    required this.model,
  });

  final ResultListGameEntite model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          height: 120,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.transparent,
            AppColors.blackDefaultColor.withOpacity(0.7)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AutoSizeText(
                model.name,
                style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StarRating(
                    rating: model.rating,
                    color: AppColors.purpleNeonColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: AutoSizeText(
                      model.rating.toString(),
                      style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
