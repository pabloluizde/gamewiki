import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/core/cubit/menu_cubit.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/home_menu_bottom_bar.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/menu_list.dart';

class HomePageView extends StatefulWidget {
  HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final cubit = Modular.get<HomeCubit>();
  final cubitMenu = Modular.get<MenuCubit>();
  @override
  void initState() {
    cubit.reset();
    cubitMenu.reset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final _widgetOptions = MenuList(size: size, cubit: cubit);

    return BlocBuilder(
      bloc: cubitMenu,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.darkPurpleColor,
          body: _widgetOptions.widgetOptions.elementAt(
            cubitMenu.selectedIndex,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: HomeMenuBottomBar(
            cubitMenu: cubitMenu,
          ),
        );
      },
    );
  }
}
