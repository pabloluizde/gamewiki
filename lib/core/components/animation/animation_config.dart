import 'package:flutter/widgets.dart';
import 'animation_configuration.dart';
import 'animation_executor.dart';

class AnimationConfigurator extends StatelessWidget {
  final Duration? duration;
  final Duration? delay;
  final Widget Function(Animation<double>) animatedChildBuilder;

  const AnimationConfigurator({
    Key? key,
    this.duration,
    this.delay,
    required this.animatedChildBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationConfiguration = AnimationConfiguration.of(context);

    if (animationConfiguration == null) {
      throw FlutterError.fromParts(
        <DiagnosticsNode>[
          ErrorSummary(''),
          ErrorDescription(''
              ''),
          ErrorHint(' '
              ''
              ''
              ''),
        ],
      );
    }

    final positionAnimation = animationConfiguration.position;
    final durationAnimation = duration ?? animationConfiguration.duration;
    final delayAnimation = delay ?? animationConfiguration.delay;
    final columnCountAnimation = animationConfiguration.columnCount;

    return AnimationExecutor(
      duration: durationAnimation,
      delay: stagger(positionAnimation, durationAnimation, delayAnimation,
          columnCountAnimation),
      builder: (context, animationController) =>
          animatedChildBuilder(animationController!),
    );
  }

  Duration stagger(
      int position, Duration duration, Duration? delay, int columnCount) {
    var delayInMilliseconds =
        (delay == null ? duration.inMilliseconds ~/ 6 : delay.inMilliseconds);

    int _computeStaggeredGridDuration() {
      return (position ~/ columnCount + position % columnCount) *
          delayInMilliseconds;
    }

    int _computeStaggeredListDuration() {
      return position * delayInMilliseconds;
    }

    return Duration(
        milliseconds: columnCount > 1
            ? _computeStaggeredGridDuration()
            : _computeStaggeredListDuration());
  }
}
