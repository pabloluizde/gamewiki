import 'package:game_wiki_app/modules/information/infra/models/game_details_model.dart';
import 'package:game_wiki_app/modules/information/infra/models/screenshots_model/screenshots_games_data_model.dart';

abstract class IInformationDatasource {
  Future<GameDetailsModel> getDetailsGame(int id);
  Future<ScreenshotsGamesDataModel> getScreenshots(String name);
}
