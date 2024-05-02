import 'dart:convert';
import 'package:game_wiki_app/modules/information/domain/entities/screenshots_games/screenshots_image_entite.dart';

class ScreenshotsImageModel extends ScreenshotsImageEntite {
  String image;
  bool hidden;

  ScreenshotsImageModel({
    required this.image,
    required this.hidden,
  }) : super(
          image: image,
          hidden: hidden,
        );
  @override
  List<Object?> get props => [
        image,
        hidden,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'hidden': hidden,
    };
  }

  factory ScreenshotsImageModel.fromMap(Map<String, dynamic> map) {
    return ScreenshotsImageModel(
      image: map['image'],
      hidden: map['is_deleted'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ScreenshotsImageModel.fromJson(String source) =>
      ScreenshotsImageModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
