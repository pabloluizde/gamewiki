import 'package:flutter/material.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/home_body.dart';

class MenuList {
  final Size size;

  MenuList({required this.size});

  List<Widget> get widgetOptions => <Widget>[
        HomeBody(size: size),
        Text('data'),
        HomeBody(size: size),
        HomeBody(size: size),
      ];
}
