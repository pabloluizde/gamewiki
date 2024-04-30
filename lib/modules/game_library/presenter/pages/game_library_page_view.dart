import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/modules/game_library/presenter/cubit/game_library_cubit.dart';
import 'package:game_wiki_app/modules/game_library/presenter/cubit/game_library_states.dart';

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
    return Scaffold(
      body: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            if (state is GameLibrarySuccessState) {
              return GridView.builder(
                itemCount: cubit.listGames.length,
                padding: const EdgeInsets.all(12.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0, // spacing between columns
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 200,
                    height: 200,
                    margin: const EdgeInsets.all(12.0),
                    color: Colors.amber,
                  );
                },
              );
            }
            return Container();
          }),
    );
  }
}
