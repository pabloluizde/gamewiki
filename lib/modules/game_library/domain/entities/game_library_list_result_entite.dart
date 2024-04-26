import 'package:equatable/equatable.dart';

class GameLibraryListResultEntite extends Equatable {
  final int id;
  final String slug;
  final String name;
  final String released;
  final bool tba;
  final String backgroundImage;
  final double rating;
  final int ratingTop;
  final int ratingsCount;
  final int reviewsTextCount;
  final int added;
  final int metacritic;
  final int playtime;
  final int suggestionsCount;
  final String updated;

  GameLibraryListResultEntite({
    required this.id,
    required this.slug,
    required this.name,
    required this.released,
    required this.tba,
    required this.backgroundImage,
    required this.rating,
    required this.ratingTop,
    required this.ratingsCount,
    required this.reviewsTextCount,
    required this.added,
    required this.metacritic,
    required this.playtime,
    required this.suggestionsCount,
    required this.updated,
  });
  @override
  List<Object?> get props => [
        id,
        slug,
        name,
        released,
        tba,
        backgroundImage,
        rating,
        ratingTop,
        ratingsCount,
        reviewsTextCount,
        added,
        metacritic,
        playtime,
        suggestionsCount,
        updated,
      ];
}
