import 'package:dartz/dartz.dart';
import 'package:game_wiki_app/core/errors/errors_core.dart';
import 'package:game_wiki_app/core/models/error_model.dart';
import 'package:game_wiki_app/modules/home/domain/entities/list_game_data_entite.dart';
import 'package:game_wiki_app/modules/home/domain/repositories/home_repository.dart';
import 'package:game_wiki_app/modules/home/infra/datasources/i_home_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final IHomeDatasource datasource;

  HomeRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, ListGameDataEntite>> getListOfGames(
      String page) async {
    try {
      dynamic result;
      final ListGameDataEntite fourYouBankTransactionsDataEntite;
      result = await datasource.getListOfGames(page);
      fourYouBankTransactionsDataEntite = result;
      return right(fourYouBankTransactionsDataEntite);
    } catch (e) {
      if (e is ErrorModelCore) {
        ErrorModelCore error = e;
        return left(error);
      }
      return left(Failure());
    }
  }
}
