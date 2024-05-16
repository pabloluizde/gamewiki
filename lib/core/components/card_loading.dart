import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/resume_list/text_container.dart';
import 'package:shimmer/shimmer.dart';

class CardLoading extends StatelessWidget {
  const CardLoading({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 31, 0, 63),
        highlightColor: Color.fromARGB(139, 219, 219, 219),
        enabled: true,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                child: Container(
                  width: size.width * 0.6,
                  height: size.height,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                                  )),
                            ),
                            HomeTextCardLoading(
                              size: size,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
          },
        ));
  }
}
