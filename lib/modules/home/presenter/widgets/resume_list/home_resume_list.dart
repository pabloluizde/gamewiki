import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_state.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/resume_list/card_loading.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/resume_list/home_card_resume.dart';

class HomeResumeList extends StatefulWidget {
  final HomeCubit cubit;
  final Size size;
  const HomeResumeList({
    super.key,
    required this.cubit,
    required this.size,
  });

  @override
  State<HomeResumeList> createState() => _HomeResumeListState();
}

class _HomeResumeListState extends State<HomeResumeList> {
  @override
  void initState() {
    widget.cubit.homeRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height * 0.35,
      child: BlocBuilder(
          bloc: widget.cubit,
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return HomeCardLoading(
                size: widget.size,
              );
            }
            if (state is HomeSuccessState) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.cubit.listGames.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 10),
                    child: HomeCardResumeGames(
                        size: widget.size,
                        image: widget.cubit.listGames[index].backgroundImage,
                        title: widget.cubit.listGames[index].name,
                        description: widget.cubit.listGames[index].released),
                  );
                },
              );
            }
            return Container();
          }),
    );
  }
}
