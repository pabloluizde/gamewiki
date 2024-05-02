import 'package:equatable/equatable.dart';

class ScreenshotsImageEntite extends Equatable {
  final String image;
  final bool hidden;

  ScreenshotsImageEntite({
    required this.image,
    required this.hidden,
  });
  @override
  List<Object?> get props => [
        image,
        hidden,
      ];
}
