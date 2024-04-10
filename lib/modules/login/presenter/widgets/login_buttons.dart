import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/components/default_button.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/core/utils/app_modals.dart';
import 'package:game_wiki_app/modules/login/presenter/cubit/login_cubit.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({
    super.key,
    required this.size,
    required this.cubit,
  });

  final Size size;
  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultButton(
              radius: 30,
              text: 'Login',
              color: Colors.white,
              fontColor: AppColors.purpleNeonColor,
              width: size.width * 0.40,
              height: size.height * 0.05,
              onTap: () {
                AppModal.loginSheet(context, cubit, size);
              }),
          DefaultButton(
            radius: 30,
            text: 'SignUp',
            color: AppColors.purpleNeonColor,
            fontColor: Colors.white,
            width: size.width * 0.4,
            height: size.height * 0.05,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
