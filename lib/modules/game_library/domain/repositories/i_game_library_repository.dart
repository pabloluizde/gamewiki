import 'package:dartz/dartz.dart';
import 'package:game_wiki_app/core/entites/games/list_game_data_entite.dart';
import 'package:game_wiki_app/core/errors/errors_core.dart';

abstract class IGameLibraryRepository {
  Future<Either<Failure, ListGameDataEntite>> getListOfGames(String page);
}
