import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/home_text_card.dart';

class HomeCardResumeGames extends StatelessWidget {
  const HomeCardResumeGames({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.size,
  });

  final String image;
  final String title;
  final String description;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      height: 300,
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
                HomeTextCard(title: title, description: description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
