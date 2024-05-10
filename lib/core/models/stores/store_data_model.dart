import 'package:game_wiki_app/core/entites/store/stores_entite.dart';
import 'package:game_wiki_app/core/models/stores/store_result_model.dart';

class StoreDataModel extends StoreDataEntite {
  StoreDataModel({
    required final int count,
    required final String next,
    required final String previous,
    required final List<StoreResultModel> result,
  }) : super(
          count: count,
          next: next,
          previous: previous,
          result: result,
        );

  factory StoreDataModel.fromJson(Map<String, dynamic> json) => StoreDataModel(
        count: json['count'],
        next: json['next'] ?? '',
        previous: '',
        result: json['results'] != null
            ? (json['results'] as List<dynamic>)
                .map((e) => StoreResultModel.fromMap(e as Map<String, dynamic>))
                .toList()
            : [],
      );
  factory StoreDataModel.empty() {
    return StoreDataModel(
      count: 0,
      next: '',
      previous: '',
      result: [],
    );
  }
}
