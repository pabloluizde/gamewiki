import 'package:dio/dio.dart';
import 'package:game_wiki_app/core/dio/dio_base.dart';
import 'package:game_wiki_app/core/dio/dio_client.dart';
import 'package:game_wiki_app/core/dio/enum/dio_methods.dart';
import 'package:game_wiki_app/modules/information/infra/datasources/i_information_datasource.dart';
import 'package:game_wiki_app/modules/information/infra/models/game_details_model.dart';
import 'package:game_wiki_app/modules/information/infra/models/screenshots_model/screenshots_games_data_model.dart';

class DioInformationDatasourceImpl implements IInformationDatasource {
  final DioClient dioClient;
  DioInformationDatasourceImpl(this.dioClient);

  @override
  Future<GameDetailsModel> getDetailsGame(int id) async {
    try {
      final response = await dioClient.request(
        url:
            '${DioResquestsBase.baseUrl}games/$id?${DioResquestsBase.tokenRequest}',
        method: DioMethod.GET,
      );
      final jsonResult = response.body;
      GameDetailsModel model = GameDetailsModel.fromMap(jsonResult!);
      return model;
    } on DioException catch (e) {
      var error = e.response!.data;
      throw error;
    }
  }

  @override
  Future<ScreenshotsGamesDataModel> getScreenshots(String name) async {
    try {
      final response = await dioClient.request(
        url:
            '${DioResquestsBase.baseUrl}games/$name/screenshots?${DioResquestsBase.tokenRequest}',
        method: DioMethod.GET,
      );
      final jsonResult = response.body;
      ScreenshotsGamesDataModel model =
          ScreenshotsGamesDataModel.fromJson(jsonResult!);
      return model;
    } on DioException catch (e) {
      var error = e.response!.data;
      throw error;
    }
  }
}
