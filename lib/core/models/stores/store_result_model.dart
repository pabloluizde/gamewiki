import 'dart:convert';
import 'package:game_wiki_app/core/entites/store/store_result_entite.dart';

class StoreResultModel extends StoreResultEntite {
  const StoreResultModel({
    required int id,
    required String slug,
    required String name,
    required String domain,
    required int gamesCount,
    required String imageBackGround,
  }) : super(
            id: id,
            slug: slug,
            name: name,
            domain: domain,
            gamesCount: gamesCount,
            imageBackGround: imageBackGround);
  @override
  List<Object?> get props => [
        id,
        slug,
        name,
        domain,
        gamesCount,
        imageBackGround,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'slug': slug,
      'name': name,
      'domain': domain,
      'games_count': gamesCount,
      'image_background': imageBackGround,
    };
  }

  factory StoreResultModel.fromMap(Map<String, dynamic> map) {
    return StoreResultModel(
      id: map['id'],
      slug: map['slug'],
      name: map['name'],
      domain: map['domain'],
      gamesCount: map['games_count'],
      imageBackGround: map['image_background'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreResultModel.fromJson(String source) =>
      StoreResultModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
