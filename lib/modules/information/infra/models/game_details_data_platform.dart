import 'dart:convert';
import 'package:game_wiki_app/modules/information/domain/entities/game_details_data_platform.dart';
import 'package:game_wiki_app/modules/information/infra/models/game_details_plataforms.dart';

class GameDetailsDataPlataformsModel extends GameDetailsDataPlatformsEntite {
  final GameDetailsPlataformsModel platforms;

  GameDetailsDataPlataformsModel({
    required this.platforms,
  }) : super(
          platform: platforms,
        );
  @override
  List<Object?> get props => [
        platforms,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'platforms': platforms,
    };
  }

  factory GameDetailsDataPlataformsModel.fromMap(Map<String, dynamic> map) {
    return GameDetailsDataPlataformsModel(
      platforms: GameDetailsPlataformsModel.fromMap(map['platform']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GameDetailsDataPlataformsModel.fromJson(String source) =>
      GameDetailsDataPlataformsModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
