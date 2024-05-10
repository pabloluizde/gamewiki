import 'package:equatable/equatable.dart';

class StoreResultEntite extends Equatable {
  final int id;
  final String name;
  final String domain;
  final String slug;
  final int gamesCount;
  final String imageBackGround;

  const StoreResultEntite({
    required this.id,
    required this.name,
    required this.domain,
    required this.slug,
    required this.gamesCount,
    required this.imageBackGround,
  });
  @override
  List<Object?> get props => [
        id,
        name,
        domain,
        slug,
        gamesCount,
        imageBackGround,
      ];
}
