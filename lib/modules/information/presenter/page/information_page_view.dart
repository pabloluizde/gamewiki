import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/core/entites/games/result_list_game_entite.dart';
import 'package:game_wiki_app/modules/information/presenter/cubit/information_cubit.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/information_body.dart';

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
    cubit.getDetails(widget.tag.id, widget.tag.slug);
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
