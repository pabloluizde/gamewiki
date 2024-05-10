import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/core/components/default_login_button.dart';
import 'package:game_wiki_app/core/components/text_field_default.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/core/utils/app_routes.dart';
import 'package:game_wiki_app/modules/login/presenter/cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.cubit,
    required this.size,
  });

  final LoginCubit cubit;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: AutoSizeText(
              'Login'.toUpperCase(),
              strutStyle: const StrutStyle(height: 3, forceStrutHeight: true),
              style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldDefault(
                labelColor: Colors.black,
                textColor: Colors.black,
                controller: cubit.email,
                label: 'Email',
              ),
              const SizedBox(height: 20),
              TextFieldDefault(
                labelColor: Colors.black,
                textColor: Colors.black,
                controller: cubit.password,
                isPassword: true,
                label: 'Password',
              ),
            ],
          ),
          BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: DefaultLoginButton(
                      state: state,
                      radius: 30,
                      text: 'Enter',
                      color: AppColors.purpleNeonColor,
                      fontColor: Colors.white,
                      width: size.width * 0.40,
                      height: size.height * 0.05,
                      onTap: () async {
                        await cubit.login().then((value) {
                          if (value) {
                            Modular.to.pushNamed(AppRoutes.homePage);
                          }
                        });
                      }),
                );
              }),
        ],
      ),
    );
  }
}
