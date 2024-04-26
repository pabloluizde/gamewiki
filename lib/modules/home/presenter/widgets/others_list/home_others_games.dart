import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_state.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/others_list/others_games_loading.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/others_list/home_others_games_card.dart';

class HomeOthersGames extends StatelessWidget {
  const HomeOthersGames({
    super.key,
    required this.cubit,
    required this.size,
  });

  final HomeCubit cubit;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.21,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: AutoSizeText(
              'Store',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Expanded(
            child: BlocBuilder(
                bloc: cubit,
                builder: (context, state) {
                  if (state is HomeLoadingState) {
                    return HomeOthersGamesLoading(
                      size: size,
                    );
                  }
                  if (state is HomeSuccessState) {
                    return ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.listStore.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10),
                          child: HomeOthersGamesCard(
                            size: size,
                            image: cubit.listStore[index].imageBackGround,
                            title: cubit.listStore[index].name,
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                }),
          ),
        ],
      ),
    );
  }
}
