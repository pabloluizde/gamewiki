import 'package:equatable/equatable.dart';
import 'package:game_wiki_app/modules/game_library/domain/entities/game_library_list_result_entite.dart';

class GameLibraryDataEntite extends Equatable {
  final int count;
  final String next;
  final String previous;
  final List<GameLibraryListResultEntite> result;

  GameLibraryDataEntite({
    required this.count,
    required this.next,
    required this.previous,
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
