import 'dart:convert';
import 'package:game_wiki_app/modules/information/domain/entities/game_details_entitie.dart';
import 'package:game_wiki_app/modules/information/infra/models/game_details_data_platform.dart';

class GameDetailsModel extends GameDetailsDataEntitie {
  int id;
  String slug;
  String name;
  String nameOriginal;
  String description;
  String released;
  bool tba;
  String backgroundImage;
  List<GameDetailsDataPlataformsModel> platforms;

  GameDetailsModel({
    required this.id,
    required this.slug,
    required this.name,
    required this.nameOriginal,
    required this.description,
    required this.released,
    required this.tba,
    required this.backgroundImage,
    required this.platforms,
  }) : super(
            id: id,
            slug: slug,
            name: name,
            nameOriginal: nameOriginal,
            description: description,
            released: released,
            tba: tba,
            backgroundImage: backgroundImage,
            platforms: platforms);
  @override
  List<Object?> get props => [
        id,
        slug,
        name,
        released,
        tba,
        backgroundImage,
        id,
        slug,
        name,
        nameOriginal,
        description,
        released,
        tba,
        backgroundImage,
        platforms,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'slug': slug,
      'name': name,
      'name_original': nameOriginal,
      'description': description,
      'released': released,
      'tba': tba,
      'background_image': backgroundImage,
      'platforms': platforms.map((x) => x.toMap()).toList(),
    };
  }

  factory GameDetailsModel.empty() {
    return GameDetailsModel(
      backgroundImage: '',
      description: '',
      id: 0,
      name: '',
      nameOriginal: '',
      platforms: [],
      released: '',
      slug: '',
      tba: false,
    );
  }

  factory GameDetailsModel.fromMap(Map<String, dynamic> map) {
    return GameDetailsModel(
      id: map['id'],
      slug: map['slug'],
      name: map['name'],
      nameOriginal: map['name_original'],
      description: map['description'],
      released: map['released'],
      tba: map['tba'],
      backgroundImage: map['background_image'],
      platforms: map['platforms'] != null
          ? (map['platforms'] as List<dynamic>)
              .map((e) => GameDetailsDataPlataformsModel.fromMap(
                  e as Map<String, dynamic>))
              .toList()
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory GameDetailsModel.fromJson(String source) =>
      GameDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
