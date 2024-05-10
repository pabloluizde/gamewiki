import 'package:equatable/equatable.dart';

class GameDetailsPlataformsEntite extends Equatable {
  final int id;
  final String slug;
  final String name;

  const GameDetailsPlataformsEntite({
    required this.id,
    required this.slug,
    required this.name,
  });
  @override
  List<Object?> get props => [
        id,
        slug,
        name,
      ];
}
