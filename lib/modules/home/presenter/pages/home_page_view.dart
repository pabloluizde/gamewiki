import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.blackDefaultColor,
      ),
    );
  }
}
