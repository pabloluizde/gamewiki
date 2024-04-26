import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wiki_app/core/errors/errors_core.dart';
import 'package:game_wiki_app/core/models/error_model.dart';
import 'package:game_wiki_app/core/utils/connection_validate.dart';
import 'package:game_wiki_app/modules/information/domain/usecases/information_usecase.dart';
import 'package:game_wiki_app/modules/information/infra/models/game_details_model.dart';
import 'package:game_wiki_app/modules/information/presenter/cubit/information_states.dart';

class InformationCubit extends Cubit<InformationState> {
  InformationUsecase usecase;
  InformationCubit(this.usecase) : super(const InformationInitialState());

  final model = GameDetailsModel.empty();

  ScrollController scrollController = ScrollController();
  ScrollController scrollStoreController = ScrollController();
  String msg = '';

  getDetails(int id) async {
    await getDetailsGame(id);
  }

  Future<void> getDetailsGame(int id) async {
    emit(const InformationLoadingState());
    msg = '';
    bool connect = await verifyConexao();

    if (connect) {
      var result = await usecase.getDetailsGame(id);
      if (result != null || result != Failure) {
        if (result is GameDetailsModel) {
          emit(const InformationLoadingState());
          setResult(result);
          emit(const InformationSuccessState());
        } else if (result is ErrorModelCore) {
          msg = result.message!;
          emit(const InformationErrorState());
        } else {
          emit(const InformationErrorState());
        }
      } else {
        emit(const InformationErrorState());
      }
    } else {
      msg = '';
      emit(const InformationErrorState());
    }
  }

  String filterText(String text) {
    var removeTags = text
        .replaceAll('<br />', '')
        .replaceAll('</p>', '')
        .replaceAll('<p>', '');
    var textEnglsh = removeTags.split('Español');
    var result = textEnglsh[0];
    return result;
  }

  setResult(GameDetailsModel data) {
    model.platforms = data.platforms;
    model.name = data.name;
    model.nameOriginal = data.nameOriginal;
    model.description = data.description;
    model.backgroundImage = data.backgroundImage;
  }
}
