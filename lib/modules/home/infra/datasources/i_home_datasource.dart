import 'package:game_wiki_app/modules/home/infra/models/list_game_data_model.dart';

abstract class IHomeDatasource {
  Future<ListGameDataModel> getListOfGames(String page);
}
