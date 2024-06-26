import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/components/text_field_default.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/search/presenter/cubit/search_cubit.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    super.key,
    required this.size,
    required this.cubit,
  });

  final Size size;
  final SearchCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.greyDefaultColor,
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.75,
                    child: TextFieldDefault(
                      onChanged: (value) async {
                        cubit.listGames.clear();
                        if (cubit.searchController.text.length > 2) {
                          cubit.pageGame = '1';
                          await cubit.searchGames(
                              value, int.parse(cubit.pageGame));
                        } else if (cubit.searchController.text.isEmpty) {
                          cubit.pageGame = '1';
                          await cubit.searchGames('', 1);
                        }
                      },
                      labelOn: false,
                      cursorColor: Colors.white,
                      radius: 15,
                      hintColor: Colors.white,
                      fontSize: 15,
                      controller: cubit.searchController,
                      hint: 'Search',
                      textColor: Colors.white,
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.darkPurpleColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const RotatedBox(
                        quarterTurns: 1,
                        child: Icon(
                          Icons.tune_outlined,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 38,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.blackDefaultColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
            ),
          )
        ],
      ),
    );
  }
}
