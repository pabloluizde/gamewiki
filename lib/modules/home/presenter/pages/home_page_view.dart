import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/home_body.dart';

class HomePageView extends StatelessWidget {
  HomePageView({super.key});

  final cubit = Modular.get<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.darkPurpleColor,
      body: HomeBody(size: size, cubit: cubit),
    );
  }
}
