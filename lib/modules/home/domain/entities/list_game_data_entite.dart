import 'package:equatable/equatable.dart';
import 'package:game_wiki_app/modules/home/domain/entities/result_list_game_entite.dart';

class ListGameDataEntite extends Equatable {
  final int count;
  final String next;
  final String previous;
  final List<ResultListGameEntite> result;

  ListGameDataEntite({
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
