import 'package:game_wiki_app/modules/search/domain/repositories/search_repositories.dart';

abstract class SearchUsecase {
  Future<dynamic> searchGames(String game, int page);
}

class SearchUsecaseimpl implements SearchUsecase {
  final ISearchRepository repository;
  SearchUsecaseimpl(this.repository);

  @override
  Future searchGames(String game, int page) async {
    dynamic model;
    var result = await repository.searchGames(game, page);
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
