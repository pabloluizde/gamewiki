import 'package:game_wiki_app/modules/search/domain/repositories/search_repositories.dart';

abstract class SearchUsecase {
  Future<dynamic> getListOfGames(String game);
}

class SearchUsecaseimpl implements SearchUsecase {
  final ISearchRepository repository;
  SearchUsecaseimpl(this.repository);

  @override
  Future getListOfGames(String game) async {
    dynamic model;
    var result = await repository.searchGames(game);
    result.fold(
      (error) {
        var model = error;
        return model;
      },
      (success) {
        model = success;
        return model;
      },
    );
    return model;
  }
}
