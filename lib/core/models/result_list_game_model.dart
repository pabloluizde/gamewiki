import 'dart:convert';
import 'package:game_wiki_app/core/entites/games/result_list_game_entite.dart';

class ResultListGameModel extends ResultListGameEntite {
  ResultListGameModel({
    required int id,
    required String slug,
    required String name,
    required String released,
    required bool tba,
    required String backgroundImage,
    required double rating,
    required int ratingTop,
    required int ratingsCount,
    required int reviewsTextCount,
    required int added,
    required int metacritic,
    required int playtime,
    required int suggestionsCount,
    required String updated,
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

  factory ResultListGameModel.fromMap(Map<String, dynamic> map) {
    return ResultListGameModel(
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

  factory ResultListGameModel.fromJson(String source) =>
      ResultListGameModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
