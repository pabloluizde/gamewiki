import 'package:flutter/material.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/home_body.dart';
import 'package:game_wiki_app/modules/profile/presenter/page/profile_page_view.dart';
import 'package:game_wiki_app/modules/search/presenter/pages/search_page_view.dart';

class MenuList {
  final Size size;
  final HomeCubit cubit;

  MenuList({required this.size, required this.cubit});

  List<Widget> get widgetOptions => <Widget>[
        HomeBody(
          size: size,
          cubit: cubit,
        ),
        SearchPageView(),
        Text('Like'),
      ];
}
