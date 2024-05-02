import 'package:game_wiki_app/modules/information/domain/entities/screenshots_games/screenshots_games_data_entite.dart';
import 'package:game_wiki_app/modules/information/infra/models/screenshots_model/screenshots_image_model.dart';

class ScreenshotsGamesDataModel extends ScreenshotsGamesDataEntite {
  int? count;
  String? next;
  String? previous;
  List<ScreenshotsImageModel> result;

  ScreenshotsGamesDataModel({
    this.count,
    this.next,
    this.previous,
    required this.result,
  }) : super(
          count: count,
          next: next,
          previous: previous,
          result: result,
        );

  factory ScreenshotsGamesDataModel.fromJson(Map<String, dynamic> json) =>
      ScreenshotsGamesDataModel(
        result: json['results'] != null
            ? (json['results'] as List<dynamic>)
                .map((e) =>
                    ScreenshotsImageModel.fromMap(e as Map<String, dynamic>))
                .toList()
            : [],
      );
  factory ScreenshotsGamesDataModel.empty() {
    return ScreenshotsGamesDataModel(
      count: 0,
      next: '',
      previous: '',
      result: [],
    );
  }
}
