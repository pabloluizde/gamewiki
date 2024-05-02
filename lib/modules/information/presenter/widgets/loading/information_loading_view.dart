import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/information_expanded_appbar.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/loading/information_card_loading.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/loading/information_loading_description.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/loading/information_loading_platforms.dart';
import 'package:shimmer/shimmer.dart';

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
                  ),
                  Container(
                    height: size.height * 0.25,
                    child: Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 170, 170, 170),
                      highlightColor: const Color.fromARGB(152, 193, 193, 193),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5.0,
                              ),
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                height: size.height * 0.25,
                                width: size.width * 0.95,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
