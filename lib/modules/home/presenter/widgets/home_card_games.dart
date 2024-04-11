import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/home_text_card.dart';

class HomeCardGames extends StatelessWidget {
  const HomeCardGames({
    super.key,
    required this.image,
    required this.title,
    required this.size,
  });

  final String image;
  final String title;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
            color: AppColors.blackDefaultColor,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                image,
              ),
            ),
          )),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 12,
                sigmaY: 12,
              ),
              child: Container(
                height: size.height,
                width: size.width,
                color: Colors.black.withOpacity(0.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Container(
                          height: 200,
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
                    HomeTextCard(title: title),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
