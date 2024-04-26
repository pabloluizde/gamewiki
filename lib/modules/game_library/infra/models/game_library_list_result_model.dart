import 'dart:convert';
import 'package:game_wiki_app/modules/game_library/domain/entities/game_library_list_result_entite.dart';

class GameLibraryListResultModel extends GameLibraryListResultEntite {
  int id;
  String slug;
  String name;
  String released;
  bool tba;
  String backgroundImage;
  double rating;
  int ratingTop;
  int ratingsCount;
  int reviewsTextCount;
  int added;
  int metacritic;
  int playtime;
  int suggestionsCount;
  String updated;

  GameLibraryListResultModel({
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
  }) : super(
          id: id,
          slug: slug,
          name: name,
          released: released,
          tba: tba,
          backgroundImage: backgroundImage,
          rating: rating,
          ratingTop: ratingTop,
          ratingsCount: ratingsCount,
          reviewsTextCount: reviewsTextCount,
          added: added,
          metacritic: metacritic,
          playtime: playtime,
          suggestionsCount: suggestionsCount,
          updated: updated,
        );
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'slug': slug,
      'name': name,
      'released': released,
      'tba': tba,
      'background_image': backgroundImage,
      'rating': rating,
      'rating_top': ratingTop,
      'ratings_count': ratingsCount,
      'reviews_text_count': reviewsTextCount,
      'added': added,
      'metacritic': metacritic,
      'playtime': playtime,
      'suggestions_count': suggestionsCount,
      'updated': updated,
    };
  }

  factory GameLibraryListResultModel.fromMap(Map<String, dynamic> map) {
    return GameLibraryListResultModel(
      id: map['id'],
      slug: map['slug'],
      name: map['name'],
      released: map['released'],
      tba: map['tba'],
      backgroundImage: map['background_image'],
      rating: map['rating'],
      ratingTop: map['rating_top'],
      ratingsCount: map['ratings_count'],
      reviewsTextCount: map['reviews_text_count'],
      added: map['added'],
      metacritic: map['metacritic'] ?? 0,
      playtime: map['playtime'],
      suggestionsCount: map['suggestions_count'],
      updated: map['updated'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GameLibraryListResultModel.fromJson(String source) =>
      GameLibraryListResultModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
