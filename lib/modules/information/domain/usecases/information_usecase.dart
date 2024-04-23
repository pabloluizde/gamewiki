import 'package:game_wiki_app/modules/information/domain/repositories/i_information_repository.dart';

abstract class InformationUsecase {
  Future<dynamic> getDetailsGame(int id);
}

class InformationUsecaseimpl implements InformationUsecase {
  final IInformationRepository repository;
  InformationUsecaseimpl(this.repository);

  @override
  Future getDetailsGame(int id) async {
    dynamic model;
    var result = await repository.getDetailsGame(id);
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
