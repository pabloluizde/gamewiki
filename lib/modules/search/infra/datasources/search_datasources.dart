import 'package:game_wiki_app/core/models/list_game_data_model.dart';

abstract class ISearchDatasource {
  Future<ListGameDataModel> searchGames(String game);
}
