import 'package:game_wiki_app/core/models/stores/store_data_model.dart';
import 'package:game_wiki_app/core/models/list_game_data_model.dart';

abstract class IHomeDatasource {
  Future<ListGameDataModel> getListOfGames();
  Future<StoreDataModel> getListStores(String page);
}
