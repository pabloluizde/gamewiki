import 'package:game_wiki_app/modules/home/domain/repositories/home_repository.dart';

abstract class HomeUsecase {
  Future<dynamic> getListOfGames(String page);
}

class HomeUsecaseimpl implements HomeUsecase {
  final HomeRepository repository;
  HomeUsecaseimpl(this.repository);

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
