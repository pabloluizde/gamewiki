import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_state.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/home_list.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final cubit = Modular.get<HomeCubit>();

  @override
  void initState() {
    cubit.homeRequest();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.blackDefaultColor,
        body: NestedScrollView(headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                leading: null,
                floating: true,
                snap: true,
                expandedHeight: 200.0,
                forceElevated: innerBoxIsScrolled,
              ),
            ),
          ];
        }, body: Builder(builder: (BuildContext context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
              SliverFixedExtentList(
                itemExtent: 48.0,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) =>
                      ListTile(title: Text('Item $index')),
                  childCount: 30,
                ),
              ),
            ],
          );
        })));
  }
}
