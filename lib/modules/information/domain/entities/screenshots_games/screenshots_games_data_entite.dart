import 'package:equatable/equatable.dart';
import 'package:game_wiki_app/modules/information/domain/entities/screenshots_games/screenshots_image_entite.dart';

class ScreenshotsGamesDataEntite extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<ScreenshotsImageEntite> result;

  ScreenshotsGamesDataEntite({
    this.count,
    this.next,
    this.previous,
    required this.result,
  });

  @override
  List<Object?> get props => [
        count,
        next,
        previous,
        result,
      ];
}
