import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wiki_app/core/components/animation/animation_limiter.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/game_library/presenter/cubit/game_library_cubit.dart';
import 'package:game_wiki_app/modules/game_library/presenter/cubit/game_library_states.dart';
import 'package:game_wiki_app/modules/game_library/presenter/widgets/library_list.dart';
import 'package:game_wiki_app/core/components/loading_body.dart';

class LibraryAnimatedGrid extends StatefulWidget {
  const LibraryAnimatedGrid({
    super.key,
    required this.cubit,
    required this.size,
  });

  final GameLibraryCubit cubit;
  final Size size;

  @override
  State<LibraryAnimatedGrid> createState() => _LibraryAnimatedGridState();
}

class _LibraryAnimatedGridState extends State<LibraryAnimatedGrid> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    widget.cubit.listGames.clear();
    widget.cubit.getGameList();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        widget.cubit.getGameList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: widget.cubit,
        builder: (context, state) {
          return AnimationLimiter(
            child: Material(
              color: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.darkPurpleColor,
                    borderRadius: BorderRadius.circular(10)),
                child: GridView.count(
                  controller: _scrollController,
                  childAspectRatio: (16 / 19),
                  padding: const EdgeInsets.only(top: 30),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: List.generate(
                    widget.cubit.listGames.length,
                    (int index) {
                      if (state is GameLibraryLoadingState) {
                        return LoadingBody(
                          size: widget.size,
                          index: index,
                        );
                      }
                      if (state is GameLibrarySuccessState) {
                        return LibraryList(
                          cubit: widget.cubit,
                          size: widget.size,
                          index: index,
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ),
            ),
          );
        });
  }
}
