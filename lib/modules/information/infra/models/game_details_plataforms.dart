import 'dart:convert';
import 'package:game_wiki_app/modules/information/domain/entities/game_details_plataform_entite.dart';

class GameDetailsPlataformsModel extends GameDetailsPlataformsEntite {
  final int id;
  final String slug;
  final String name;

  GameDetailsPlataformsModel({
    required this.id,
    required this.slug,
    required this.name,
  }) : super(
          id: id,
          slug: slug,
          name: name,
        );
  @override
  List<Object?> get props => [
        id,
        slug,
        name,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'slug': slug,
      'name': name,
    };
  }

  factory GameDetailsPlataformsModel.fromMap(Map<String, dynamic> map) {
    return GameDetailsPlataformsModel(
      id: map['id'],
      slug: map['slug'] ?? '',
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GameDetailsPlataformsModel.fromJson(String source) =>
      GameDetailsPlataformsModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
