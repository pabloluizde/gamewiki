import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wiki_app/core/entites/store/store_result_entite.dart';
import 'package:game_wiki_app/core/entites/store/stores_entite.dart';
import 'package:game_wiki_app/core/errors/errors_core.dart';
import 'package:game_wiki_app/core/models/error_model.dart';
import 'package:game_wiki_app/core/models/stores/store_data_model.dart';
import 'package:game_wiki_app/core/models/stores/store_result_model.dart';
import 'package:game_wiki_app/core/utils/connection_validate.dart';
import 'package:game_wiki_app/modules/home/domain/entities/list_game_data_entite.dart';
import 'package:game_wiki_app/modules/home/domain/entities/result_list_game_entite.dart';
import 'package:game_wiki_app/modules/home/domain/usecases/home_usecase.dart';
import 'package:game_wiki_app/modules/home/infra/models/result_list_game_model.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeUsecase usecase;
  HomeCubit(this.usecase) : super(const HomeInitialState());

  List<ResultListGameEntite> listGames = <ResultListGameModel>[];
  List<StoreResultEntite> listStore = <StoreResultModel>[];

  ScrollController scrollController = ScrollController();
  String msg = '';
  String page = '1';

  Future<void> getGameList() async {
    emit(const HomeLoadingState());
    msg = '';
    bool connect = await verifyConexao();

    if (connect) {
      var result = await usecase.getListOfGames(page);
      if (result != null || result != Failure) {
        if (result is ListGameDataEntite) {
          emit(const HomeLoadingState());
          setList(result.result);
          setPage(result);

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
      var result = await usecase.getListStores(page);
      if (result != null || result != Failure) {
        if (result is StoreDataEntite) {
          emit(const HomeLoadingState());
          setListStore(result.result);
          // setPage(result);

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

  setPage(ListGameDataEntite data) {
    var split = data.next.split('page=');
    page = split[1].toString();
  }

  setList(List<ResultListGameEntite> data) {
    emit(const HomeLoadingState());
    listGames.addAll(data);

    emit(const HomeSuccessState());
  }

  setListStore(List<StoreResultEntite> data) {
    emit(const HomeLoadingState());
    listStore.addAll(data);

    emit(const HomeSuccessState());
  }
}
