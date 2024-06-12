import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_state.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/carrousel/home_carousel_images.dart';
import 'package:game_wiki_app/modules/home/presenter/widgets/carrousel/home_carousel_loading.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({
    super.key,
    required this.cubit,
    required this.size,
  });

  final HomeCubit cubit;
  final Size size;

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: widget.cubit,
        builder: (context, state) {
          if (state is HomeSuccessState) {
            return HomeCarouselImages(cubit: widget.cubit);
          }
          if (state is HomeLoadingState) {
            return const HomeCarouselLoading();
          }
          return Container();
        });
  }
}
