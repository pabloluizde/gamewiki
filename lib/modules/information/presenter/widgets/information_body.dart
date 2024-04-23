import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/home/domain/entities/result_list_game_entite.dart';
import 'package:game_wiki_app/modules/information/presenter/cubit/information_cubit.dart';
import 'package:game_wiki_app/modules/information/presenter/cubit/information_states.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/information_view_image.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/informations_platforms.dart';

class InformationBody extends StatelessWidget {
  const InformationBody({
    super.key,
    required this.size,
    required this.cubit,
    required this.tag,
  });

  final Size size;
  final InformationCubit cubit;
  final ResultListGameEntite tag;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                backgroundColor: AppColors.blackDefaultColor,
                flexibleSpace: InformationViewImage(model: tag),
                leading: Container(),
                floating: true,
                pinned: false,
                expandedHeight: size.height * 0.4,
                forceElevated: innerBoxIsScrolled,
              ),
            ],
        body: Material(
          child: Container(
            height: size.height,
            color: AppColors.blackDefaultColor,
            child: BlocBuilder(
                bloc: cubit,
                builder: (context, state) {
                  if (state is InformationSuccessState) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            InformationsPlatforms(cubit: cubit),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: AutoSizeText(
                                cubit.filterText(cubit.model.description),
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Container();
                }),
          ),
        ));
  }
}
