import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wiki_app/core/components/default_button.dart';
import 'package:game_wiki_app/core/components/error_button.dart';
import 'package:game_wiki_app/core/components/loading_button.dart';
import 'package:game_wiki_app/core/components/text_field_default.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/sign_up/presenter/cubit/sign_up_cubit.dart';
import 'package:game_wiki_app/modules/sign_up/presenter/cubit/sign_up_states.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.cubit,
    required this.size,
  });

  final SignUpCubit cubit;
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
              'SignUp'.toUpperCase(),
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
                controller: cubit.name,
                label: 'Name',
              ),
              const SizedBox(height: 20),
              TextFieldDefault(
                labelColor: Colors.black,
                textColor: Colors.black,
                controller: cubit.nickname,
                label: 'Nickname',
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              TextFieldDefault(
                labelColor: Colors.black,
                textColor: Colors.black,
                controller: cubit.confirmPassword,
                isPassword: true,
                label: 'Confirm Password',
              ),
            ],
          ),
          BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                if (state is SignUpInitialState) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: DefaultButton(
                        radius: 30,
                        text: 'Create',
                        color: AppColors.purpleNeonColor,
                        fontColor: Colors.white,
                        width: size.width * 0.40,
                        height: size.height * 0.05,
                        onTap: () async {}),
                  );
                }
                if (state is SignUpSuccessState) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: StateButton(
                        icon: Icons.check,
                        radius: 30,
                        color: AppColors.greenSuccess,
                        width: size.width * 0.40,
                        height: size.height * 0.05,
                      ));
                }
                if (state is SignUpLoadingState) {
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
                if (state is SignUpErrorState) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: StateButton(
                      icon: Icons.close,
                      radius: 30,
                      color: AppColors.redError,
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
