import 'package:dio/dio.dart';
import 'package:game_wiki_app/core/dio/dio_base.dart';
import 'package:game_wiki_app/core/dio/dio_client.dart';
import 'package:game_wiki_app/core/dio/enum/dio_methods.dart';
import 'package:game_wiki_app/core/models/stores/store_data_model.dart';
import 'package:game_wiki_app/modules/home/infra/datasources/i_home_datasource.dart';
import 'package:game_wiki_app/modules/home/infra/models/list_game_data_model.dart';

class DioHomeDatasourceImpl implements IHomeDatasource {
  final DioClient dioClient;
  DioHomeDatasourceImpl(this.dioClient);

  @override
  Future<ListGameDataModel> getListOfGames() async {
    try {
      final response = await dioClient.request(
        url:
            '${DioResquestsBase.baseUrl}games?${DioResquestsBase.tokenRequest}',
        method: DioMethod.GET,
      );
      final jsonResult = response.body;
      ListGameDataModel model = ListGameDataModel.fromJson(jsonResult!);
      return model;
    } on DioException catch (e) {
      var error = e.response!.data;
      throw e;
    }
  }

  @override
  Future<StoreDataModel> getListStores(String page) async {
    try {
      final response = await dioClient.request(
        url:
            '${DioResquestsBase.baseUrl}stores?${DioResquestsBase.tokenRequest}',
        method: DioMethod.GET,
      );
      final jsonResult = response.body;
      StoreDataModel model = StoreDataModel.fromJson(jsonResult!);
      return model;
    } on DioException catch (e) {
      var error = e.response!.data;
      throw e;
    }
  }
}
