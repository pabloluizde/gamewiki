import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/components/image_painel.dart';
import 'package:game_wiki_app/modules/login/presenter/cubit/login_cubit.dart';

class LoginCarousel extends StatefulWidget {
  final LoginCubit cubit;
  final Size size;
  const LoginCarousel({super.key, required this.cubit, required this.size});

  @override
  State<LoginCarousel> createState() => _LoginCarouselState();
}

class _LoginCarouselState extends State<LoginCarousel> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: widget.cubit.carrosselBackgroundPageController,
          itemCount: widget.cubit.list.length,
          itemBuilder: (context, index) {
            return ImagePainel(
              size: widget.size,
              image: widget.cubit.list[index],
            );
          },
        ),
        ClipRRect(
          clipBehavior: Clip.hardEdge,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 15,
              sigmaY: 15,
            ),
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child: SizedBox(
              width: double.infinity,
              height: widget.size.height * 0.76,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: widget.cubit.carrosselPageController,
                itemCount: widget.cubit.list.length,
                itemBuilder: (context, index) {
                  return ImagePainel(
                    size: widget.size,
                    image: widget.cubit.list[index],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
