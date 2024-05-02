import 'package:game_wiki_app/core/models/list_game_data_model.dart';
import 'package:game_wiki_app/modules/game_library/infra/models/game_library_data_model.dart';

abstract class IGameLibraryDatasource {
  Future<ListGameDataModel> getListOfGames(String page);
}
