import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wiki_app/core/components/expanded_text.dart';
import 'package:game_wiki_app/modules/information/presenter/cubit/information_cubit.dart';
import 'package:game_wiki_app/modules/information/presenter/cubit/information_states.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/information_screenshots.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/informations_platforms.dart';

class InformationList extends StatelessWidget {
  const InformationList({
    super.key,
    required this.size,
    required this.cubit,
  });

  final Size size;
  final InformationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            if (state is InformationSuccessState) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InformationsPlatforms(cubit: cubit),
                      ExpandableText(
                        cubit.filterText(cubit.model.description),
                        trimLines: 5,
                      ),
                      InformationScreenshots(
                        cubit: cubit,
                        size: size,
                      )
                    ],
                  ),
                ),
              );
            }
            return Container();
          }),
    );
  }
}
