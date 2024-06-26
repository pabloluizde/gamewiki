import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wiki_app/core/cubit/menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(const MenuInitialState());

  int selectedIndex = 0;
  void reset() {
    selectedIndex = 0;
    emit(MenuInitialState());
  }

  setIndex(int index) {
    emit(MenuInitialState());
    selectedIndex = index;
    emit(MenuSuccessState());
  }
}
