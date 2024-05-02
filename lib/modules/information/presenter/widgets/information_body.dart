import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/core/entites/games/result_list_game_entite.dart';
import 'package:game_wiki_app/modules/information/presenter/cubit/information_cubit.dart';
import 'package:game_wiki_app/modules/information/presenter/cubit/information_states.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/information_expanded_appbar.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/information_list.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/loading/information_loading_view.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/information_view_image.dart';

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
    return ProviderScope(
      child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            if (state is InformationLoadingState) {
              return InformationBodyLoading(
                size: size,
              );
            }
            if (state is InformationSuccessState) {
              return NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                        ExpandingAppBar(
                          title: tag.name,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: InformationViewImage(model: tag),
                            )
                          ],
                        )
                      ],
                  body: Material(
                    color: AppColors.blackDefaultColor,
                    child: InformationList(size: size, cubit: cubit),
                  ));
            }
            return Container();
          }),
    );
  }
}
