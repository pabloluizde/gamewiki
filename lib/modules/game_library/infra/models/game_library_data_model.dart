import 'package:game_wiki_app/modules/game_library/domain/entities/game_library_data_entite.dart';
import 'package:game_wiki_app/modules/game_library/infra/models/game_library_list_result_model.dart';

class GameLibraryDataModel extends GameLibraryDataEntite {
  int count;
  String next;
  String previous;
  List<GameLibraryListResultModel> result;

  GameLibraryDataModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.result,
  }) : super(
          count: count,
          next: next,
          previous: previous,
          result: result,
        );

  factory GameLibraryDataModel.fromJson(Map<String, dynamic> json) =>
      GameLibraryDataModel(
        count: json['count'],
        next: json['next'],
        previous: '',
        result: json['results'] != null
            ? (json['results'] as List<dynamic>)
                .map((e) => GameLibraryListResultModel.fromMap(
                    e as Map<String, dynamic>))
                .toList()
            : [],
      );
  factory GameLibraryDataModel.empty() {
    return GameLibraryDataModel(
      count: 0,
      next: '',
      previous: '',
      result: [],
    );
  }
}
