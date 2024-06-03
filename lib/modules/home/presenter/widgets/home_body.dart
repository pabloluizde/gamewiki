import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/home_appbar.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/others_list/home_others_games.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/resume_list/home_resume.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
    required this.size,
    required this.cubit,
  });

  final Size size;
  final HomeCubit cubit;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    widget.cubit.getHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                flexibleSpace: AppBarHome(size: widget.size),
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
              HomeOthersGames(cubit: widget.cubit, size: widget.size),
              HomeResume(cubit: widget.cubit, size: widget.size),
            ],
          ),
        ));
  }
}
