import 'package:flutter/material.dart';
import 'package:game_wiki_app/modules/login/presenter/cubit/login_cubit.dart';
import 'package:game_wiki_app/modules/login/presenter/widgets/login_form.dart';
import 'package:game_wiki_app/modules/sign_up/presenter/cubit/sign_up_cubit.dart';
import 'package:game_wiki_app/modules/sign_up/presenter/widgets/sign_up_form.dart';

class AppModal {
  static loginSheet(BuildContext context, LoginCubit cubit, Size size) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 320,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: LoginForm(
            size: size,
            cubit: cubit,
          ),
        );
      },
    );
  }

  static signUpSheet(BuildContext context, SignUpCubit cubit, Size size) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: size.height * 0.6,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: SignUpForm(
            size: size,
            cubit: cubit,
          ),
        );
      },
    );
  }
}
