import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/home/domain/entities/result_list_game_entite.dart';
import 'package:game_wiki_app/modules/information/presenter/widgets/information_view_image.dart';

class InformationPageView extends StatefulWidget {
  final ResultListGameEntite tag;
  const InformationPageView({super.key, required this.tag});

  @override
  State<InformationPageView> createState() => _InformationPageViewState();
}

class _InformationPageViewState extends State<InformationPageView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Hero(
      tag: widget.tag.backgroundImage,
      child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  backgroundColor: AppColors.blackDefaultColor,
                  flexibleSpace: InformationViewImage(model: widget.tag),
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
              child: SingleChildScrollView(
                child: Column(
                  children: [],
                ),
              ),
            ),
          )),
    ));
  }
}
