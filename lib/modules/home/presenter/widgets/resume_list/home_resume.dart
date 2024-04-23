import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_state.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/resume_list/card_loading.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/resume_list/home_resume_list.dart';

class HomeResume extends StatelessWidget {
  final HomeCubit cubit;
  final Size size;
  const HomeResume({
    super.key,
    required this.cubit,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.38,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: AutoSizeText(
              'Games',
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
                    return HomeCardLoading(
                      size: size,
                    );
                  }
                  if (state is HomeSuccessState) {
                    return HomeResumeList(
                      cubit: cubit,
                      size: size,
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
