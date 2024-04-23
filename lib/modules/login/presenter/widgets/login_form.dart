import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/core/components/default_button.dart';
import 'package:game_wiki_app/core/components/error_button.dart';
import 'package:game_wiki_app/core/components/loading_button.dart';
import 'package:game_wiki_app/core/components/text_field_default.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/core/utils/app_routes.dart';
import 'package:game_wiki_app/modules/login/presenter/cubit/login_cubit.dart';
import 'package:game_wiki_app/modules/login/presenter/cubit/login_state.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
                if (state is LoginInitialState) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: DefaultButton(
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
                }
                if (state is LoginSuccessState) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: StateButton(
                        icon: Icons.check,
                        radius: 30,
                        color: Color.fromARGB(255, 33, 246, 100),
                        width: size.width * 0.40,
                        height: size.height * 0.05,
                      ));
                }
                if (state is LoginLoadingState) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ButtonLoading(
                      radius: 30,
                      color: AppColors.purpleNeonColor,
                      width: size.width * 0.40,
                      height: size.height * 0.05,
                    ),
                  );
                }
                if (state is LoginErrorState) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: StateButton(
                      icon: Icons.close,
                      radius: 30,
                      color: const Color.fromARGB(255, 251, 34, 34),
                      width: size.width * 0.40,
                      height: size.height * 0.05,
                    ),
                  );
                }
                return Container();
              }),
        ],
      ),
    );
  }
}
