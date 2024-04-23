import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/core/dio/dio_client.dart';
import 'package:game_wiki_app/core/dio/get_dio_register.dart';
import 'package:game_wiki_app/core/dio/i_dio_client.dart';
import 'package:game_wiki_app/core/utils/app_routes.dart';
import 'package:game_wiki_app/modules/home/domain/repositories/home_repository.dart';
import 'package:game_wiki_app/modules/home/domain/usecases/home_usecase.dart';
import 'package:game_wiki_app/modules/home/external/dio_home_impl.dart';
import 'package:game_wiki_app/modules/home/infra/datasources/i_home_datasource.dart';
import 'package:game_wiki_app/modules/home/infra/repositories/home_repositoy_impl.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:game_wiki_app/modules/home/presenter/pages/home_page_view.dart';
import 'package:game_wiki_app/modules/information/domain/repositories/i_information_repository.dart';
import 'package:game_wiki_app/modules/information/domain/usecases/information_usecase.dart';
import 'package:game_wiki_app/modules/information/external/dio_information_datasource_impl.dart';
import 'package:game_wiki_app/modules/information/infra/datasources/i_information_datasource.dart';
import 'package:game_wiki_app/modules/information/infra/repositories/infomation_repository_impl.dart';
import 'package:game_wiki_app/modules/information/presenter/cubit/information_cubit.dart';
import 'package:game_wiki_app/modules/information/presenter/page/information_page_view.dart';
import 'package:game_wiki_app/modules/login/presenter/cubit/login_cubit.dart';
import 'package:game_wiki_app/modules/login/presenter/pages/login_page_view.dart';
import 'package:game_wiki_app/modules/sign_up/presenter/cubit/sign_up_cubit.dart';
import 'package:game_wiki_app/modules/splash/presenter/cubit/splash_cubit.dart';
import 'package:game_wiki_app/modules/splash/presenter/pages/splash_page_view.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(() => DioClient(i<DioOptionsSetup>().getInstance()));
    i.add<IDioClient>(DioClient.new);
    i.add(DioOptionsSetup.new);
    i.addSingleton<SplashCubit>(SplashCubit.new);
    i.addSingleton<LoginCubit>(LoginCubit.new);
    i.addSingleton<HomeCubit>(HomeCubit.new);
    i.addSingleton<SignUpCubit>(SignUpCubit.new);
    i.addSingleton<InformationCubit>(InformationCubit.new);
    i.add<HomeUsecase>(HomeUsecaseimpl.new);
    i.add<HomeRepository>(HomeRepositoryImpl.new);
    i.add<IHomeDatasource>(DioHomeDatasourceImpl.new);
    i.add<InformationUsecase>(InformationUsecaseimpl.new);
    i.add<IInformationRepository>(InformationRepositoryImpl.new);
    i.add<IInformationDatasource>(DioInformationDatasourceImpl.new);
  }

  @override
  void routes(r) {
    r.child(AppRoutes.splash, child: (context) => const SplashPageView());

    r.child(AppRoutes.homePage, child: (context) => HomePageView());
    r.child(AppRoutes.login,
        child: (context) => const LoginPageView(),
        transition: TransitionType.downToUp,
        duration: const Duration(milliseconds: 400));
    r.child(
      AppRoutes.informationPage,
      child: (context) => InformationPageView(tag: r.args.data),
    );
  }
}
