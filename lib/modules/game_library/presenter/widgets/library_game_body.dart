import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/components/button_back.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/game_library/presenter/cubit/game_library_cubit.dart';
import 'package:game_wiki_app/modules/game_library/presenter/widgets/app_bar_library.dart';
import 'package:game_wiki_app/modules/game_library/presenter/widgets/library_animated_grid.dart';

class LibraryGameBody extends StatelessWidget {
  const LibraryGameBody({
    super.key,
    required this.cubit,
    required this.size,
  });

  final GameLibraryCubit cubit;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                flexibleSpace: AppBarLibrary(size: size),
                shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                backgroundColor: innerBoxIsScrolled
                    ? AppColors.darkPurpleColor
                    : AppColors.blackDefaultColor,
                leading: const InformationButtonBack(),
                pinned: true,
                primary: true,
                forceElevated: true,
                expandedHeight: 70.0,
              ),
            ],
        body: LibraryAnimatedGrid(cubit: cubit, size: size));
  }
}
