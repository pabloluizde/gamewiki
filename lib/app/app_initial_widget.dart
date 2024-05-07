import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/app/app_translates.dart';
import 'package:get/get.dart';

class AppInitialWidget extends StatelessWidget {
  const AppInitialWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: '',
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      translations: LocalizationsApp(),
    );
  }
}
