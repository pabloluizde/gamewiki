import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_state.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/others_list/others_games_loading.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/resume_list/home_card_resume.dart';
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
    return BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return HomeOthersGamesLoading(
              size: size,
            );
          }
          if (state is HomeSuccessState) {
            return ListView.builder(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
        });
  }
}
