import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/core/utils/app_animations.dart';
import 'package:game_wiki_app/core/utils/app_routes.dart';
import 'package:lottie/lottie.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({
    super.key,
  });

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AppAnimations.splashAnimation,
        controller: _controller,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward().whenComplete(() {
              Modular.to.pushNamed(AppRoutes.login);
            });
        },
      ),
    );
  }
}
