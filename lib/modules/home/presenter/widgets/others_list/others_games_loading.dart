import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class HomeOthersGamesLoading extends StatelessWidget {
  const HomeOthersGamesLoading({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 31, 0, 63),
      highlightColor: const Color.fromARGB(139, 219, 219, 219),
      enabled: true,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: size.width * 0.2,
                      height: size.height * 0.1,
                      decoration: BoxDecoration(
                        color: AppColors.blackDefaultColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 70,
                      height: 20,
                      decoration: BoxDecoration(
                          color: AppColors.blackDefaultColor,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ],
                ));
          }),
    );
  }
}
