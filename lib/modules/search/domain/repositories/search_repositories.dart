import 'package:dartz/dartz.dart';
import 'package:game_wiki_app/core/errors/errors_core.dart';
import 'package:game_wiki_app/core/entites/games/list_game_data_entite.dart';

abstract class ISearchRepository {
  Future<Either<Failure, ListGameDataEntite>> searchGames(String game);
}
