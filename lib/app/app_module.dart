import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/core/utils/app_routes.dart';
import 'package:game_wiki_app/modules/home/presenter/pages/home_page_view.dart';
import 'package:game_wiki_app/modules/login/presenter/cubit/login_cubit.dart';
import 'package:game_wiki_app/modules/login/presenter/pages/login_page_view.dart';
import 'package:game_wiki_app/modules/splash/presenter/cubit/splash_cubit.dart';
import 'package:game_wiki_app/modules/splash/presenter/pages/splash_page_view.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<SplashCubit>(SplashCubit.new);
    i.addSingleton<LoginCubit>(LoginCubit.new);
  }

  @override
  void routes(r) {
    r.child(AppRoutes.splash, child: (context) => const SplashPageView());

    r.child(AppRoutes.homePage, child: (context) => const HomePageView());
    r.child(AppRoutes.login,
        child: (context) => const LoginPageView(),
        transition: TransitionType.downToUp,
        duration: const Duration(milliseconds: 400));
  }
}
