import 'package:flutter/material.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/home_body.dart';
import 'package:game_wiki_app/modules/profile/presenter/page/profile_page_view.dart';

class MenuList {
  final Size size;

  MenuList({required this.size});

  List<Widget> get widgetOptions => <Widget>[
        HomeBody(size: size),
        Text('Like'),
        Text('Search'),
        ProfilePageView()
      ];
}
