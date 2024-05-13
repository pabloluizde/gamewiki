import 'package:dio/dio.dart';
import 'package:game_wiki_app/core/dio/dio_base.dart';
import 'package:game_wiki_app/core/dio/dio_client.dart';
import 'package:game_wiki_app/core/dio/enum/dio_methods.dart';
import 'package:game_wiki_app/core/models/list_game_data_model.dart';
import 'package:game_wiki_app/modules/search/infra/datasources/search_datasources.dart';

class DioSearchDatasourceImpl implements ISearchDatasource {
  final DioClient dioClient;
  DioSearchDatasourceImpl(this.dioClient);

  @override
  Future<ListGameDataModel> searchGames(String game) async {
    try {
      final response = await dioClient.request(
        url:
            '${DioResquestsBase.baseUrl}games?${DioResquestsBase.tokenRequest}&search=${game}',
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
