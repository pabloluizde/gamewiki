import 'package:dartz/dartz.dart';
import 'package:game_wiki_app/core/entites/store/stores_entite.dart';
import 'package:game_wiki_app/core/errors/errors_core.dart';
import 'package:game_wiki_app/core/models/error_model.dart';
import 'package:game_wiki_app/core/entites/games/list_game_data_entite.dart';
import 'package:game_wiki_app/modules/home/domain/repositories/home_repository.dart';
import 'package:game_wiki_app/modules/home/infra/datasources/i_home_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final IHomeDatasource datasource;

  HomeRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, ListGameDataEntite>> getListOfGames() async {
    try {
      dynamic result;
      final ListGameDataEntite listGames;
      result = await datasource.getListOfGames();
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

  @override
  Future<Either<Failure, StoreDataEntite>> getListStores(String page) async {
    try {
      dynamic result;
      final StoreDataEntite listStores;
      result = await datasource.getListStores(page);
      listStores = result;
      return right(listStores);
    } catch (e) {
      if (e is ErrorModelCore) {
        ErrorModelCore error = e;
        return left(error);
      }
      return left(Failure());
    }
  }
}
