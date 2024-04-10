import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/app/app_initial_widget.dart';
import 'package:game_wiki_app/app/app_module.dart';

class AppBuild extends StatefulWidget {
  const AppBuild({
    super.key,
  });

  @override
  State<AppBuild> createState() => _AppBuildState();
}

class _AppBuildState extends State<AppBuild> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: AppModule(),
      child: const AppInitialWidget(),
    );
  }
}
