import 'package:flutter/material.dart';

class AnimationConfiguration extends InheritedWidget {
  final int position;
  final Duration duration;
  final Duration? delay;
  final int columnCount;

  const AnimationConfiguration.synchronized({
    Key? key,
    this.duration = const Duration(milliseconds: 225),
    required Widget child,
  })  : position = 0,
        delay = Duration.zero,
        columnCount = 1,
        super(key: key, child: child);

  const AnimationConfiguration.staggeredList({
    Key? key,
    required this.position,
    this.duration = const Duration(milliseconds: 225),
    this.delay,
    required Widget child,
  })  : columnCount = 1,
        super(key: key, child: child);

  const AnimationConfiguration.staggeredGrid({
    Key? key,
    required this.position,
    this.duration = const Duration(milliseconds: 225),
    this.delay,
    required this.columnCount,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  static List<Widget> toStaggeredList({
    Duration? duration,
    Duration? delay,
    required Widget Function(Widget) childAnimationBuilder,
    required List<Widget> children,
  }) =>
      children
          .asMap()
          .map((index, widget) {
            return MapEntry(
              index,
              AnimationConfiguration.staggeredList(
                position: index,
                duration: duration ?? const Duration(milliseconds: 225),
                delay: delay,
                child: childAnimationBuilder(widget),
              ),
            );
          })
          .values
          .toList();

  static AnimationConfiguration? of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<AnimationConfiguration>();
  }
}
