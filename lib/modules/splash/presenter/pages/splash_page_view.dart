import 'package:flutter/material.dart';
import 'package:game_wiki_app/modules/splash/presenter/widgets/splash_body.dart';

class SplashPageView extends StatefulWidget {
  const SplashPageView({
    super.key,
  });

  @override
  State<SplashPageView> createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<SplashPageView> {
  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SplashBody(),
      ),
    );
  }
}
