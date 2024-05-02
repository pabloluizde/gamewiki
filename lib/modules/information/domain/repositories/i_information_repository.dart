import 'package:dartz/dartz.dart';
import 'package:game_wiki_app/core/errors/errors_core.dart';
import 'package:game_wiki_app/modules/information/domain/entities/game_details_entitie.dart';
import 'package:game_wiki_app/modules/information/domain/entities/screenshots_games/screenshots_games_data_entite.dart';

abstract class IInformationRepository {
  Future<Either<Failure, GameDetailsDataEntitie>> getDetailsGame(int id);
  Future<Either<Failure, ScreenshotsGamesDataEntite>> getScreenshots(
      String name);
}
