import 'package:equatable/equatable.dart';
import 'package:game_wiki_app/core/entites/store/store_result_entite.dart';

class StoreDataEntite extends Equatable {
  final int count;
  final String next;
  final String previous;
  final List<StoreResultEntite> result;

  StoreDataEntite({
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
