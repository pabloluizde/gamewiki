import 'package:flutter/widgets.dart';
import 'package:game_wiki_app/core/components/animation/animation_config.dart';

class SlideAnimation extends StatelessWidget {
  final Duration? duration;
  final Duration? delay;
  final Curve curve;
  final double verticalOffset;
  final double horizontalOffset;
  final Widget child;
  const SlideAnimation({
    Key? key,
    this.duration,
    this.delay,
    this.curve = Curves.ease,
    double? verticalOffset,
    double? horizontalOffset,
    required this.child,
  })  : verticalOffset = (verticalOffset == null && horizontalOffset == null)
            ? 50.0
            : (verticalOffset ?? 0.0),
        horizontalOffset = horizontalOffset ?? 0.0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfigurator(
      duration: duration,
      delay: delay,
      animatedChildBuilder: _slideAnimation,
    );
  }

  Widget _slideAnimation(Animation<double> animation) {
    Animation<double> offsetAnimation(
        double offset, Animation<double> animation) {
      return Tween<double>(begin: offset, end: 0.0).animate(
        CurvedAnimation(
          parent: animation,
          curve: Interval(0.0, 1.0, curve: curve),
        ),
      );
    }

    return Transform.translate(
      offset: Offset(
        horizontalOffset == 0.0
            ? 0.0
            : offsetAnimation(horizontalOffset, animation).value,
        verticalOffset == 0.0
            ? 0.0
            : offsetAnimation(verticalOffset, animation).value,
      ),
      child: child,
    );
  }
}
