import 'package:flutter/widgets.dart';
import 'package:game_wiki_app/core/components/animation/animation_config.dart';

class FadeInAnimation extends StatelessWidget {
  final Duration? duration;

  final Duration? delay;

  final Curve curve;

  final Widget child;

  const FadeInAnimation({
    Key? key,
    this.duration,
    this.delay,
    this.curve = Curves.ease,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfigurator(
      duration: duration,
      delay: delay,
      animatedChildBuilder: _fadeInAnimation,
    );
  }

  Widget _fadeInAnimation(Animation<double> animation) {
    final opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animation,
        curve: Interval(0.0, 1.0, curve: curve),
      ),
    );

    return Opacity(
      opacity: opacityAnimation.value,
      child: child,
    );
  }
}
