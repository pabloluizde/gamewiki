import 'package:dartz/dartz.dart';
import 'package:game_wiki_app/core/errors/errors_core.dart';
import 'package:game_wiki_app/core/models/error_model.dart';
import 'package:game_wiki_app/modules/information/domain/entities/game_details_entitie.dart';
import 'package:game_wiki_app/modules/information/domain/repositories/i_information_repository.dart';
import 'package:game_wiki_app/modules/information/infra/datasources/i_information_datasource.dart';

class InformationRepositoryImpl implements IInformationRepository {
  final IInformationDatasource datasource;

  InformationRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, GameDetailsDataEntitie>> getDetailsGame(int id) async {
    try {
      dynamic result;
      final GameDetailsDataEntitie gameDetails;
      result = await datasource.getDetailsGame(id);
      gameDetails = result;
      return right(gameDetails);
    } catch (e) {
      if (e is ErrorModelCore) {
        ErrorModelCore error = e;
        return left(error);
      }
      return left(Failure());
    }
  }
}
