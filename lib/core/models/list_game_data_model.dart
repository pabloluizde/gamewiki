import 'package:game_wiki_app/core/entites/games/list_game_data_entite.dart';
import 'package:game_wiki_app/core/entites/games/result_list_game_entite.dart';
import 'package:game_wiki_app/core/models/result_list_game_model.dart';

class ListGameDataModel extends ListGameDataEntite {
  int count;
  String next;
  String previous;
  List<ResultListGameEntite> result;

  ListGameDataModel({
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

  factory ListGameDataModel.fromJson(Map<String, dynamic> json) =>
      ListGameDataModel(
        count: json['count'],
        next: json['next'],
        previous: '',
        result: json['results'] != null
            ? (json['results'] as List<dynamic>)
                .map((e) =>
                    ResultListGameModel.fromMap(e as Map<String, dynamic>))
                .toList()
            : [],
      );
  factory ListGameDataModel.empty() {
    return ListGameDataModel(
      count: 0,
      next: '',
      previous: '',
      result: [],
    );
  }
}
