import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wiki_app/core/errors/errors_core.dart';
import 'package:game_wiki_app/core/models/error_model.dart';
import 'package:game_wiki_app/core/utils/connection_validate.dart';
import 'package:game_wiki_app/modules/game_library/domain/entities/game_library_data_entite.dart';
import 'package:game_wiki_app/modules/game_library/domain/entities/game_library_list_result_entite.dart';
import 'package:game_wiki_app/modules/game_library/infra/models/game_library_list_result_model.dart';
import 'package:game_wiki_app/modules/game_library/presenter/cubit/game_library_states.dart';
import 'package:game_wiki_app/modules/home/domain/usecases/home_usecase.dart';

class GameLibraryCubit extends Cubit<GameLibraryState> {
  HomeUsecase usecase;
  GameLibraryCubit(this.usecase) : super(const GameLibraryInitialState());

  List<GameLibraryListResultEntite> listGames = <GameLibraryListResultModel>[];

  ScrollController scrollController = ScrollController();
  String msg = '';
  String pageGame = '1';

  getHome() async {
    listGames.clear();
    await getGameList();
  }

  Future<void> getGameList() async {
    emit(const GameLibraryLoadingState());
    msg = '';
    bool connect = await verifyConexao();

    if (connect) {
      var result = await usecase.getListOfGames();
      if (result != null || result != Failure) {
        if (result is GameLibraryDataEntite) {
          emit(const GameLibraryLoadingState());
          setList(result.result);
          setPageGame(result);

          emit(const GameLibrarySuccessState());
        } else if (result is ErrorModelCore) {
          msg = result.message!;
          emit(const GameLibraryErrorState());
        } else {
          emit(const GameLibraryErrorState());
        }
      } else {
        emit(const GameLibraryErrorState());
      }
    } else {
      msg = '';
      emit(const GameLibraryErrorState());
    }
  }

  setPageGame(GameLibraryDataEntite data) {
    var split = data.next.split('page=');
    pageGame = split[1].toString();
  }

  setList(List<GameLibraryListResultEntite> data) {
    emit(const GameLibraryLoadingState());
    listGames.addAll(data);

    emit(const GameLibrarySuccessState());
  }
}
