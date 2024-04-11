import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wiki_app/core/dio/dio_base.dart';
import 'package:game_wiki_app/core/errors/errors_core.dart';
import 'package:game_wiki_app/core/models/error_model.dart';
import 'package:game_wiki_app/core/utils/connection_validate.dart';
import 'package:game_wiki_app/modules/home/domain/entities/list_game_data_entite.dart';
import 'package:game_wiki_app/modules/home/domain/entities/result_list_game_entite.dart';
import 'package:game_wiki_app/modules/home/domain/usecases/home_usecase.dart';
import 'package:game_wiki_app/modules/home/infra/models/list_game_data_model.dart';
import 'package:game_wiki_app/modules/home/infra/models/result_list_game_model.dart';
import 'package:game_wiki_app/modules/home/presenter/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeUsecase usecase;
  HomeCubit(this.usecase) : super(const HomeInitialState());

  ScrollController scrollController = ScrollController();

  List<ResultListGameEntite> listGames = <ResultListGameModel>[];
  String msg = '';
  String page = '1';

  Future<void> homeRequest() async {
    emit(const HomeLoadingState());
    msg = '';
    bool connect = await verifyConexao();

    if (connect) {
      var result = await usecase.getListOfGames(page);
      if (result != null || result != Failure) {
        if (result is ListGameDataEntite) {
          setList(result.result);
          setPage(result);

          emit(HomeSuccessState());
        } else if (result is ErrorModelCore) {
          msg = result.message!;
          emit(HomeErrorState());
        } else {
          emit(HomeErrorState());
        }
      } else {
        emit(const HomeErrorState());
      }
    } else {
      msg = '';
      emit(HomeErrorState());
    }
  }

  setPage(ListGameDataEntite data) {
    var split = data.next.split('page=');
    page = split[1].toString();
  }

  setList(List<ResultListGameEntite> data) {
    emit(HomeLoadingState());
    listGames.addAll(data);

    emit(HomeSuccessState());
  }
}