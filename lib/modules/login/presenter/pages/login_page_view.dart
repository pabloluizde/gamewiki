import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/modules/login/presenter/cubit/login_cubit.dart';
import 'package:game_wiki_app/modules/login/presenter/widgets/login_body.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  final cubit = Modular.get<LoginCubit>();

  @override
  void initState() {
    cubit.carouselTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: LoginBody(cubit: cubit, size: size),
    );
  }
}
