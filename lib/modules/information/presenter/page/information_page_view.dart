import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/home/domain/entities/result_list_game_entite.dart';
import 'package:game_wiki_app/modules/information/presenter/cubit/information_cubit.dart';
import 'package:game_wiki_app/modules/information/presenter/cubit/information_states.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/information_body.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/information_view_image.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/informations_platforms.dart';

class InformationPageView extends StatefulWidget {
  final ResultListGameEntite tag;
  const InformationPageView({super.key, required this.tag});

  @override
  State<InformationPageView> createState() => _InformationPageViewState();
}

class _InformationPageViewState extends State<InformationPageView> {
  final cubit = Modular.get<InformationCubit>();
  @override
  void initState() {
    cubit.getDetails(widget.tag.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Hero(
      tag: widget.tag.backgroundImage,
      child: InformationBody(
        tag: widget.tag,
        size: size,
        cubit: cubit,
      ),
    ));
  }
}
