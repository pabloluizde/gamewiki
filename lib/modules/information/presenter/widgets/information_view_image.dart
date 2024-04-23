import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/home/domain/entities/result_list_game_entite.dart';

class InformationViewImage extends StatelessWidget {
  const InformationViewImage({
    super.key,
    required this.model,
  });

  final ResultListGameEntite model;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              model.backgroundImage,
            ),
          ),
        ),
        child: Stack(
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
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AutoSizeText(
                    model.name,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  AutoSizeText(
                    model.rating.toString(),
                    strutStyle:
                        const StrutStyle(height: 1, forceStrutHeight: true),
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
