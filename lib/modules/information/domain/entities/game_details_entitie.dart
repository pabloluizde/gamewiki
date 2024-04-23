import 'package:equatable/equatable.dart';
import 'package:game_wiki_app/modules/information/domain/entities/game_details_data_platform.dart';
import 'package:game_wiki_app/modules/information/domain/entities/game_details_plataform_entite.dart';

class GameDetailsDataEntitie extends Equatable {
  final int id;
  final String slug;
  final String name;
  final String nameOriginal;
  final String description;
  final String released;
  final bool tba;
  final String backgroundImage;
  final List<GameDetailsDataPlatformsEntite> platforms;
  GameDetailsDataEntitie({
    required this.id,
    required this.slug,
    required this.name,
    required this.nameOriginal,
    required this.description,
    required this.released,
    required this.tba,
    required this.backgroundImage,
    required this.platforms,
  });
  @override
  List<Object?> get props => [
        id,
        slug,
        name,
        nameOriginal,
        description,
        released,
        tba,
        backgroundImage,
        platforms,
      ];
}
