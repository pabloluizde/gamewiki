import 'package:flutter/widgets.dart';
import 'package:game_wiki_app/core/components/animation/animation_config.dart';

class ScaleAnimation extends StatelessWidget {
  final Duration? duration;
  final Duration? delay;
  final Curve curve;
  final double scale;
  final Widget child;
  const ScaleAnimation({
    Key? key,
    this.duration,
    this.delay,
    this.curve = Curves.ease,
    this.scale = 0.0,
    required this.child,
  })  : assert(scale >= 0.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfigurator(
      duration: duration,
      delay: delay,
      animatedChildBuilder: landingAnimation,
    );
  }

  Widget landingAnimation(Animation<double> animation) {
    final landingAnimation = Tween<double>(begin: scale, end: 1.0).animate(
      CurvedAnimation(
        parent: animation,
        curve: Interval(0.0, 1.0, curve: curve),
      ),
    );

    return Transform.scale(
      scale: landingAnimation.value,
      child: child,
    );
  }
}
