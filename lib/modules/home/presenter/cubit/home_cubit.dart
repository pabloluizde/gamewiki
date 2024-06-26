import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/core/cubit/menu_cubit.dart';
import 'package:game_wiki_app/core/entites/store/store_result_entite.dart';
import 'package:game_wiki_app/core/entites/store/stores_entite.dart';
import 'package:game_wiki_app/core/errors/errors_core.dart';
import 'package:game_wiki_app/core/models/error_model.dart';
import 'package:game_wiki_app/core/models/stores/store_result_model.dart';
import 'package:game_wiki_app/core/utils/connection_validate.dart';
import 'package:game_wiki_app/core/entites/games/list_game_data_entite.dart';
import 'package:game_wiki_app/core/entites/games/result_list_game_entite.dart';
import 'package:game_wiki_app/modules/home/domain/usecases/home_usecase.dart';
import 'package:game_wiki_app/core/models/result_list_game_model.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeUsecase usecase;
  HomeCubit(this.usecase) : super(const HomeInitialState());

  final menuCubit = Modular.get<MenuCubit>();

  List<ResultListGameEntite> listGames = <ResultListGameModel>[];
  List<StoreResultEntite> listStore = <StoreResultModel>[];

  ScrollController scrollController = ScrollController();
  ScrollController scrollStoreController = ScrollController();
  PageController carrosselPageController = PageController();
  String msg = '';
  String pageGame = '1';
  String pageStore = '1';

  getHome() async {
    listStore.clear();
    listGames.clear();
    await getGameList();
    await getStores();
  }

  void reset() {
    emit(HomeInitialState());
  }

  Future<void> getGameList() async {
    emit(const HomeLoadingState());
    msg = '';
    bool connect = await verifyConexao();

    if (connect) {
      var result = await usecase.getListOfGames();
      if (result != null || result != Failure) {
        if (result is ListGameDataEntite) {
          setList(result.result);
          setPageGame(result);

          emit(const HomeSuccessState());
        } else if (result is ErrorModelCore) {
          msg = result.message!;
          emit(const HomeErrorState());
        } else {
          emit(const HomeErrorState());
        }
      } else {
        emit(const HomeErrorState());
      }
    } else {
      msg = '';
      emit(const HomeErrorState());
    }
  }

  Future<void> getStores() async {
    emit(const HomeLoadingState());
    msg = '';
    bool connect = await verifyConexao();

    if (connect) {
      var result = await usecase.getListStores(pageStore);
      if (result != null || result != Failure) {
        if (result is StoreDataEntite) {
          setListStore(result.result);

          emit(const HomeSuccessState());
        } else if (result is ErrorModelCore) {
          msg = result.message!;
          emit(const HomeErrorState());
        } else {
          emit(const HomeErrorState());
        }
      } else {
        emit(const HomeErrorState());
      }
    } else {
      msg = '';
      emit(const HomeErrorState());
    }
  }

  carouselTimer() {
    Timer.periodic(const Duration(seconds: 4), (timer) {
      if (carrosselPageController.positions.isNotEmpty) {
        if (carrosselPageController.page == listGames.length - 1) {
          carrosselPageController.animateToPage(0,
              duration: const Duration(milliseconds: 350),
              curve: Curves.linear);
        } else {
          carrosselPageController.nextPage(
              duration: const Duration(milliseconds: 350),
              curve: Curves.linear);
        }
      }
    });
  }

  setPageGame(ListGameDataEntite data) {
    var split = data.next.split('page=');
    pageGame = split[1].toString();
  }

  setList(List<ResultListGameEntite> data) {
    listGames.addAll(data);
  }

  setListStore(List<StoreResultEntite> data) {
    listStore.addAll(data);
  }
}
