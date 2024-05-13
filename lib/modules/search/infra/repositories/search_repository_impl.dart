import 'package:dartz/dartz.dart';
import 'package:game_wiki_app/core/errors/errors_core.dart';
import 'package:game_wiki_app/core/models/error_model.dart';
import 'package:game_wiki_app/core/entites/games/list_game_data_entite.dart';
import 'package:game_wiki_app/modules/search/domain/repositories/search_repositories.dart';
import 'package:game_wiki_app/modules/search/infra/datasources/search_datasources.dart';

class SearchRepositoryImpl implements ISearchRepository {
  final ISearchDatasource datasource;

  SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, ListGameDataEntite>> searchGames(String game) async {
    try {
      dynamic result;
      final ListGameDataEntite listGames;
      result = await datasource.searchGames(game);
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
