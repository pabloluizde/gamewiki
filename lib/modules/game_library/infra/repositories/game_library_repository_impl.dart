import 'package:dartz/dartz.dart';
import 'package:game_wiki_app/core/entites/games/list_game_data_entite.dart';
import 'package:game_wiki_app/core/errors/errors_core.dart';
import 'package:game_wiki_app/core/models/error_model.dart';
import 'package:game_wiki_app/modules/game_library/domain/repositories/i_game_library_repository.dart';
import 'package:game_wiki_app/modules/game_library/infra/datasources/i_game_library_datasource.dart';

class GameLibraryRepositoryImpl implements IGameLibraryRepository {
  final IGameLibraryDatasource datasource;

  GameLibraryRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, ListGameDataEntite>> getListOfGames(
      String page) async {
    try {
      dynamic result;
      final ListGameDataEntite listGames;
      result = await datasource.getListOfGames(page);
      listGames = result;
      return right(listGames);
    } catch (e) {
      if (e is ErrorModelCore) {
        ErrorModelCore error = e;
        return left(error);
      }
      return left(Failure());
    }
  }
}
