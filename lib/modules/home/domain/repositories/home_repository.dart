import 'package:dartz/dartz.dart';
import 'package:game_wiki_app/core/errors/errors_core.dart';
import 'package:game_wiki_app/modules/home/domain/entities/list_game_data_entite.dart';

abstract class HomeRepository {
  Future<Either<Failure, ListGameDataEntite>> getListOfGames(String page);
}