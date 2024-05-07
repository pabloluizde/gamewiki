import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/home_appbar.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/others_list/home_others_games.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/resume_list/home_resume.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final cubit = Modular.get<HomeCubit>();
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                flexibleSpace: AppBarHome(size: size),
                shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                backgroundColor: Colors.white,
                leading: Container(),
                floating: true,
                pinned: false,
                expandedHeight: 140.0,
                forceElevated: innerBoxIsScrolled,
              ),
            ],
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeOthersGames(cubit: cubit, size: size),
              HomeResume(cubit: cubit, size: size),
            ],
          ),
        ));
  }
}
