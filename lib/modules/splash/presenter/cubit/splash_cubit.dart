import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wiki_app/modules/splash/presenter/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const InitialSplashState());
}
