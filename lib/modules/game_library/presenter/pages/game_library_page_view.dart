import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/modules/game_library/presenter/cubit/game_library_cubit.dart';
import 'package:game_wiki_app/modules/game_library/presenter/widgets/library_game_body.dart';

class GameLibraryPageView extends StatefulWidget {
  const GameLibraryPageView({super.key});

  @override
  State<GameLibraryPageView> createState() => _GameLibraryPageViewState();
}

class _GameLibraryPageViewState extends State<GameLibraryPageView> {
  final cubit = Modular.get<GameLibraryCubit>();

  @override
  void initState() {
    cubit.getGameList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: LibraryGameBody(cubit: cubit, size: size),
    );
  }
}
