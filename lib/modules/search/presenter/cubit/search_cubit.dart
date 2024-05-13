import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wiki_app/core/entites/games/list_game_data_entite.dart';
import 'package:game_wiki_app/core/entites/games/result_list_game_entite.dart';
import 'package:game_wiki_app/core/errors/errors_core.dart';
import 'package:game_wiki_app/core/models/error_model.dart';
import 'package:game_wiki_app/core/models/result_list_game_model.dart';
import 'package:game_wiki_app/core/utils/connection_validate.dart';
import 'package:game_wiki_app/modules/search/domain/usecases/search_usecases.dart';
import 'package:game_wiki_app/modules/search/presenter/cubit/search_states.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchUsecase usecase;
  SearchCubit(this.usecase) : super(SearchInitialState());

  final searchController = TextEditingController();
  List<ResultListGameEntite> listGames = <ResultListGameModel>[];
  var msg = '';

  Future<void> searchGames(String game) async {
    emit(const SearchLoadingState());
    bool connect = await verifyConexao();

    if (connect) {
      var result = await usecase.getListOfGames(game);
      if (result != null || result != Failure) {
        if (result is ListGameDataEntite) {
          setList(result.result);

          emit(const SearchSuccessState());
        } else if (result is ErrorModelCore) {
          msg = result.message!;
          emit(const SearchErrorState());
        } else {
          emit(const SearchErrorState());
        }
      } else {
        emit(const SearchErrorState());
      }
    } else {
      msg = '';
      emit(const SearchErrorState());
    }
  }

  setList(List<ResultListGameEntite> data) {
    listGames.addAll(data);
  }
}
