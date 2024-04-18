import 'package:flutter/material.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/resume_list/home_card_resume.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/resume_list/home_resume.dart';

class HomeResumeList extends StatelessWidget {
  const HomeResumeList({
    super.key,
    required this.cubit,
    required this.size,
  });

  final HomeCubit cubit;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cubit.listGames.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
          child: HomeCardResumeGames(
              size: size,
              image: cubit.listGames[index].backgroundImage,
              title: cubit.listGames[index].name,
              description: cubit.listGames[index].released),
        );
      },
    );
  }
}
