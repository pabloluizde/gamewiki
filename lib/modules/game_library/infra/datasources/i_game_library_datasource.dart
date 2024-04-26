import 'package:game_wiki_app/modules/game_library/infra/models/game_library_data_model.dart';

abstract class IGameLibraryDatasource {
  Future<GameLibraryDataModel> getListOfGames(String page);
}
