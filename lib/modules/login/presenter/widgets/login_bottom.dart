import 'package:flutter/material.dart';
import 'package:game_wiki_app/modules/login/presenter/cubit/login_cubit.dart';
import 'package:game_wiki_app/modules/login/presenter/widgets/login_buttons.dart';
import 'package:game_wiki_app/modules/login/presenter/widgets/login_info_text.dart';

class LoginBottom extends StatelessWidget {
  const LoginBottom({
    super.key,
    required this.size,
    required this.cubit,
  });

  final Size size;
  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.74,
      left: 0,
      right: 0,
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LoginTextInfo(
              title: 'Welcome to',
              textCaps: 'GameWiki',
            ),
            LoginButtons(size: size, cubit: cubit)
          ],
        ),
      ),
    );
  }
}
