import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/search/presenter/cubit/search_cubit.dart';
import 'package:game_wiki_app/modules/search/presenter/cubit/search_states.dart';
import 'package:game_wiki_app/modules/search/presenter/widgets/search_appbar.dart';

class SearchPageView extends StatefulWidget {
  SearchPageView({super.key});

  @override
  State<SearchPageView> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  final cubit = Modular.get<SearchCubit>();
  @override
  void initState() {
    cubit.listGames.clear();
    cubit.searchGames('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.darkPurpleColor,
        body: ProviderScope(child: Builder(builder: (context) {
          return CustomScrollView(
            shrinkWrap: true,
            slivers: <Widget>[
              SliverAppBar(
                flexibleSpace: SearchAppBar(
                  size: size,
                  cubit: cubit,
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
              SliverPadding(
                  padding: const EdgeInsets.all(0.0),
                  sliver: BlocBuilder(
                      bloc: cubit,
                      builder: (conext, state) {
                        if (state is SearchSuccessState) {
                          return ProviderScope(
                              child: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              childCount: cubit.listGames.length,
                              (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    color: Colors.amber,
                                    child: Text(cubit.listGames[index].name),
                                  ),
                                );
                              },
                            ),
                          ));
                        }
                        if (state is SearchLoadingState) {
                          return ProviderScope(
                              child: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              childCount: cubit.listGames.isEmpty
                                  ? 10
                                  : cubit.listGames.length,
                              (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    color: Colors.amber,
                                    child: Text(cubit.listGames.isEmpty
                                        ? ''
                                        : cubit.listGames[index].name),
                                  ),
                                );
                              },
                            ),
                          ));
                        }
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            childCount: 10,
                            (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.amber,
                                ),
                              );
                            },
                          ),
                        );
                      })),
            ],
          );
        })));
  }
}
