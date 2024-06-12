import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/components/navbar/button_settings.dart';
import 'package:game_wiki_app/core/components/navbar/menu_flutter.dart';
import 'package:game_wiki_app/core/cubit/menu_cubit.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';

class HomeMenuBottomBar extends StatelessWidget {
  const HomeMenuBottomBar({
    super.key,
    required this.cubitMenu,
  });

  final MenuCubit cubitMenu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 110.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.greyDefaultColor,
            borderRadius: BorderRadius.circular(30)),
        height: 60,
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MenuCustom(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                ButtonSettings(
                  activeBorder: Border.all(color: Colors.white),
                  backgroundColor: Colors.white,
                  iconColor: const Color.fromARGB(255, 87, 87, 87),
                  iconActiveColor: AppColors.darkPurpleColor,
                  textColor: AppColors.darkPurpleColor,
                  hoverColor: Colors.white,
                  icon: Icons.home,
                  text: 'Home',
                ),
                ButtonSettings(
                  activeBorder: Border.all(color: Colors.white),
                  backgroundColor: Colors.white,
                  iconColor: const Color.fromARGB(255, 87, 87, 87),
                  iconActiveColor: AppColors.darkPurpleColor,
                  textColor: AppColors.darkPurpleColor,
                  hoverColor: Colors.white,
                  icon: Icons.search,
                  text: 'Search',
                ),
              ],
              selectedIndex: cubitMenu.selectedIndex,
              onTabChange: (index) {
                cubitMenu.setIndex(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
