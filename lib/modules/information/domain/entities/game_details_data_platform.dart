import 'package:equatable/equatable.dart';
import 'package:game_wiki_app/modules/information/domain/entities/game_details_plataform_entite.dart';

class GameDetailsDataPlatformsEntite extends Equatable {
  final GameDetailsPlataformsEntite platform;

  const GameDetailsDataPlatformsEntite({
    required this.platform,
  });
  @override
  List<Object?> get props => [
        platform,
      ];
}
