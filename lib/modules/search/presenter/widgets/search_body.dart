import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wiki_app/core/components/loading_body.dart';
import 'package:game_wiki_app/modules/search/presenter/cubit/search_cubit.dart';
import 'package:game_wiki_app/modules/search/presenter/cubit/search_states.dart';
import 'package:game_wiki_app/modules/search/presenter/widgets/search_animated_grid.dart';
import 'package:game_wiki_app/modules/search/presenter/widgets/search_appbar.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({
    super.key,
    required this.cubit,
    required this.size,
  });

  final SearchCubit cubit;
  final Size size;

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        widget.cubit.searchGames(widget.cubit.searchController.text,
            int.parse(widget.cubit.pageGame));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        controller: _scrollController,
        shrinkWrap: true,
        slivers: <Widget>[
          SliverAppBar(
            flexibleSpace: SearchAppBar(
              size: widget.size,
              cubit: widget.cubit,
            ),
            shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            backgroundColor: Colors.white,
            leading: Container(),
            floating: true,
            pinned: false,
            expandedHeight: 140.0,
          ),
          BlocBuilder(
              bloc: widget.cubit,
              builder: (context, state) {
                return SliverPadding(
                  padding: const EdgeInsets.all(0.0),
                  sliver: SliverGrid.count(
                    childAspectRatio: (16 / 19),
                    crossAxisCount: 2,
                    children: List.generate(
                      state is SearchLoadingState
                          ? widget.cubit.listGames.length + 10
                          : widget.cubit.listGames.length,
                      (int index) {
                        if (index < widget.cubit.listGames.length) {
                          return SearchAnimatedGrid(
                            cubit: widget.cubit,
                            size: widget.size,
                            index: index,
                          );
                        }
                        if (state is SearchLoadingState) {
                          return LoadingBody(
                            size: widget.size,
                            index: index,
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                );
              }),
        ]);
  }
}
