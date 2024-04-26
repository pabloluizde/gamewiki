import 'package:flutter/material.dart';
import 'package:game_wiki_app/modules/home/domain/entities/result_list_game_entite.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/information_text_rating.dart';

class InformationViewImage extends StatelessWidget {
  const InformationViewImage({
    super.key,
    required this.model,
  });

  final ResultListGameEntite model;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                model.backgroundImage,
              ),
            ),
          ),
          child: InformationTextRating(model: model)),
    );
  }
}
