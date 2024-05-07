import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/components/menu_flutter.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
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
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                ButtonSettings(
                  activeBorder: Border.all(color: Colors.white),
                  backgroundColor: AppColors.darkPurpleColor,
                  iconColor: Color.fromARGB(255, 87, 87, 87),
                  iconActiveColor: Colors.white,
                  textColor: Colors.white,
                  hoverColor: AppColors.darkPurpleColor,
                  icon: Icons.home,
                  text: 'Home',
                ),
                ButtonSettings(
                  activeBorder: Border.all(color: Colors.white),
                  backgroundColor: AppColors.darkPurpleColor,
                  iconColor: Color.fromARGB(255, 87, 87, 87),
                  iconActiveColor: Colors.white,
                  textColor: Colors.white,
                  icon: Icons.logo_dev,
                  text: 'Likes',
                ),
                ButtonSettings(
                  activeBorder: Border.all(color: Colors.white),
                  backgroundColor: AppColors.darkPurpleColor,
                  iconColor: Color.fromARGB(255, 87, 87, 87),
                  iconActiveColor: Colors.white,
                  textColor: Colors.white,
                  icon: Icons.search,
                  text: 'Search',
                ),
                ButtonSettings(
                  activeBorder: Border.all(color: Colors.white),
                  backgroundColor: AppColors.darkPurpleColor,
                  iconColor: Color.fromARGB(255, 87, 87, 87),
                  iconActiveColor: Colors.white,
                  textColor: Colors.white,
                  icon: Icons.abc,
                  text: 'Profile',
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
