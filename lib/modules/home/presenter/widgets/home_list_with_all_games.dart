import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_state.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/home_card_games.dart';

class HomeList extends StatefulWidget {
  final HomeCubit cubit;
  final Size size;
  const HomeList({
    super.key,
    required this.cubit,
    required this.size,
  });

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  void initState() {
    widget.cubit.scrollController.addListener(() {
      if (widget.cubit.scrollController.position.pixels ==
          widget.cubit.scrollController.position.maxScrollExtent) {
        widget.cubit.getGameList();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: widget.cubit,
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: widget.size.height,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio:
                        (widget.size.height / widget.size.width / 3.2),
                    crossAxisCount: 2,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 2.0,
                  ),
                  controller: widget.cubit.scrollController,
                  scrollDirection: Axis.vertical,
                  itemCount: widget.cubit.listGames.length + 1,
                  itemBuilder: (context, index) {
                    if (index < widget.cubit.listGames.length) {
                      return HomeCardGames(
                        size: widget.size,
                        image: widget.cubit.listGames[index].backgroundImage,
                        title: widget.cubit.listGames[index].name,
                        description: widget.cubit.listGames[index].slug,
                      );
                    } else {}
                  },
                ),
              ),
            ],
          );
        });
  }
}
