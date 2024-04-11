import 'package:dio/dio.dart';
import 'package:game_wiki_app/core/dio/dio_base.dart';
import 'package:game_wiki_app/core/dio/dio_client.dart';
import 'package:game_wiki_app/core/dio/enum/dio_methods.dart';
import 'package:game_wiki_app/modules/home/infra/datasources/i_home_datasource.dart';
import 'package:game_wiki_app/modules/home/infra/models/list_game_data_model.dart';

class DioHomeDatasourceImpl implements IHomeDatasource {
  final DioClient dioClient;
  DioHomeDatasourceImpl(this.dioClient);

  @override
  Future<ListGameDataModel> getListOfGames(String page) async {
    try {
      final response = await dioClient.request(
        url:
            '${DioResquestsBase.baseUrl}games?${DioResquestsBase.tokenRequest}&page=${page}',
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
}