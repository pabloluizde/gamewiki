import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/core/utils/app_routes.dart';
import 'package:game_wiki_app/core/entites/games/result_list_game_entite.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/resume_list/home_text_card.dart';

class CardDefeault extends StatelessWidget {
  const CardDefeault({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    required this.size,
    required this.model,
  });

  final ResultListGameEntite model;
  final String image;
  final String title;
  final double rating;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed(AppRoutes.informationPage, arguments: model);
      },
      child: Hero(
        tag: image,
        child: Material(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: size.width * 0.6,
            height: size.height,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  image,
                ),
              ),
            ),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10,
                  sigmaY: 10,
                ),
                child: Container(
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Container(
                            clipBehavior: Clip.hardEdge,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.blackDefaultColor,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: NetworkImage(
                                  image,
                                ),
                              ),
                            )),
                      ),
                      HomeTextCard(title: title, rating: rating),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
