import 'package:flutter/material.dart';
import 'package:game_wiki_app/modules/login/presenter/cubit/login_cubit.dart';
import 'package:game_wiki_app/modules/login/presenter/widgets/login_bottom.dart';
import 'package:game_wiki_app/modules/login/presenter/widgets/login_carousel.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
    required this.cubit,
    required this.size,
  });

  final LoginCubit cubit;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      LoginCarousel(cubit: cubit, size: size),
      LoginBottom(
        size: size,
        cubit: cubit,
      )
    ]);
  }
}
