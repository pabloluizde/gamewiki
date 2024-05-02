import 'package:dartz/dartz.dart';
import 'package:game_wiki_app/core/entites/games/list_game_data_entite.dart';
import 'package:game_wiki_app/core/errors/errors_core.dart';
import 'package:game_wiki_app/modules/game_library/domain/entities/game_library_data_entite.dart';

abstract class IGameLibraryRepository {
  Future<Either<Failure, ListGameDataEntite>> getListOfGames(String page);
}