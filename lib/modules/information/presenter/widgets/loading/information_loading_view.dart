import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/information_expanded_appbar.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/loading/information_card_loading.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/loading/information_loading_description.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/loading/information_loading_platforms.dart';

class InformationBodyLoading extends StatelessWidget {
  const InformationBodyLoading({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
              ExpandingAppBar(
                title: '',
                children: <Widget>[InformationCardLoading(size: size)],
              )
            ],
        body: Material(
          color: AppColors.blackDefaultColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const InformationsLoadingPlatforms(),
                  InformationsLoadingDescription(
                    size: size,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
