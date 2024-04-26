import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_wiki_app/core/components/button_back.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/core/utils/rounded_header_state.dart';

class ExpandingAppBar extends ConsumerWidget {
  const ExpandingAppBar(
      {Key? key,
      required this.title,
      this.children = const <Widget>[],
      this.mainAxisAlignment = MainAxisAlignment.start})
      : super(key: key);

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RoundedHeaderState state = ref.watch(roundedHeaderProvider);

    return SliverAppBar(
      leading: const InformationButtonBack(),
      title: Opacity(
          opacity: state.scrollFraction2,
          child: AutoSizeText(
            title,
            style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          )),
      expandedHeight: state.highestHeight,
      pinned: true,
      primary: true,
      forceElevated: true,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(state.radius)),
      ),
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          ref
              .read(roundedHeaderProvider.notifier)
              .updateHeight(constraints.maxHeight);

          return Container(
            color: AppColors.blackDefaultColor,
            child: Opacity(
              opacity: state.scrollFraction < 0.15 ? 0 : state.scrollFraction,
              child: Column(
                  mainAxisAlignment: mainAxisAlignment, children: children),
            ),
          );
        },
      ),
    );
  }
}
