import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_cubit.dart';

class HomeCarouselImages extends StatefulWidget {
  const HomeCarouselImages({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  State<HomeCarouselImages> createState() => _HomeCarouselImagesState();
}

class _HomeCarouselImagesState extends State<HomeCarouselImages> {
  @override
  void initState() {
    widget.cubit.carouselTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0, right: 5, left: 5),
      child: SizedBox(
        height: 300,
        child: PageView.builder(
          controller: widget.cubit.carrosselPageController,
          itemCount: widget.cubit.listGames.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: AppColors.greyDefaultColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Image.network(
                  widget.cubit.listGames[index].backgroundImage,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
