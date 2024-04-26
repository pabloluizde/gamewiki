import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/core/utils/app_images.dart';
import 'package:game_wiki_app/modules/login/presenter/cubit/login_state.dart';
import 'package:game_wiki_app/modules/sign_up/presenter/cubit/sign_up_cubit.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitialState());

  final signCubit = Modular.get<SignUpCubit>();

  final email = TextEditingController();
  final password = TextEditingController();
  final carrosselPageController = PageController();
  final carrosselBackgroundPageController = PageController();
  var opacityLevel = 0.0;
  final list = [
    AppImages.battlefield,
    AppImages.zelda,
    AppImages.mario,
    AppImages.gow,
    AppImages.battlefield,
    AppImages.mario,
  ];

  Future<bool> login() async {
    emit(const LoginLoadingState());

    if (email.value.text == 'pabloluiz@gmail.com' &&
        password.value.text == 'P@odeforma') {
      await Future.delayed(const Duration(seconds: 2))
          .then((value) => emit(const LoginSuccessState()));
      await Future.delayed(const Duration(seconds: 2))
          .then((value) => emit(const LoginInitialState()));
      return true;
    } else {
      await Future.delayed(const Duration(seconds: 2))
          .then((value) => emit(const LoginErrorState()));

      await Future.delayed(const Duration(seconds: 2))
          .then((value) => emit(const LoginInitialState()));
      return false;
    }
  }

  carouselTimer() {
    Timer.periodic(const Duration(seconds: 4), (timer) {
      if (carrosselPageController.page == list.length - 1) {
        carrosselPageController.animateToPage(0,
            duration: const Duration(milliseconds: 350), curve: Curves.linear);
        carrosselBackgroundPageController.animateToPage(0,
            duration: const Duration(milliseconds: 350), curve: Curves.linear);
      } else {
        carrosselPageController.nextPage(
            duration: const Duration(milliseconds: 350), curve: Curves.linear);
        carrosselBackgroundPageController.nextPage(
            duration: const Duration(milliseconds: 350), curve: Curves.linear);
      }
    });
  }
}
