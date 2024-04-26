import 'package:game_wiki_app/modules/game_library/domain/repositories/i_game_library_repository.dart';

abstract class GameLibraryUsecase {
  Future<dynamic> getListOfGames(String page);
}

class GameLibraryUsecaseimpl implements GameLibraryUsecase {
  final IGameLibraryRepository repository;
  GameLibraryUsecaseimpl(this.repository);

  @override
  Future getListOfGames(String page) async {
    dynamic model;
    var result = await repository.getListOfGames(page);
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
