import 'package:game_wiki_app/modules/information/infra/models/game_details_model.dart';

abstract class IInformationDatasource {
  Future<GameDetailsModel> getDetailsGame(int id);
}
