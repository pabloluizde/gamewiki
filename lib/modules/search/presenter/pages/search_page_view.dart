import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/search/presenter/cubit/search_cubit.dart';
import 'package:game_wiki_app/modules/search/presenter/widgets/search_body.dart';

class SearchPageView extends StatefulWidget {
  SearchPageView({super.key});

  @override
  State<SearchPageView> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  final cubit = Modular.get<SearchCubit>();
  @override
  void initState() {
    cubit.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.darkPurpleColor,
      body: ProviderScope(
        child: Builder(
          builder: (context) {
            return SearchBody(
              cubit: cubit,
              size: size,
            );
          },
        ),
      ),
    );
  }
}
