import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/core/utils/app_images.dart';
import 'package:game_wiki_app/core/utils/app_routes.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: size.height * 0.07,
          left: size.width * 0.03,
          right: size.width * 0.03,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'Welcome,'.toUpperCase(),
                    strutStyle:
                        const StrutStyle(height: 3, forceStrutHeight: true),
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackDefaultColor),
                  ),
                  AutoSizeText(
                    'LuizGameplay'.toUpperCase(),
                    strutStyle:
                        const StrutStyle(height: 2.5, forceStrutHeight: true),
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackDefaultColor),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Modular.to.pushNamed(AppRoutes.profilePage);
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        AppImages.gow,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 38,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.darkPurpleColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
          ),
        )
      ],
    );
  }
}
