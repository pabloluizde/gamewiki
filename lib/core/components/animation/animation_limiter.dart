import 'package:flutter/widgets.dart';

class AnimationLimiter extends StatefulWidget {
  final Widget child;

  const AnimationLimiter({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  AnimationLimiterState createState() => AnimationLimiterState();

  static bool? shouldRunAnimation(BuildContext context) {
    return _AnimationLimiterProvider.of(context)?.shouldRunAnimation;
  }
}

class AnimationLimiterState extends State<AnimationLimiter> {
  bool _shouldRunAnimation = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((Duration value) {
      if (!mounted) return;
      setState(() {
        _shouldRunAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _AnimationLimiterProvider(
      shouldRunAnimation: _shouldRunAnimation,
      child: widget.child,
    );
  }
}

class _AnimationLimiterProvider extends InheritedWidget {
  final bool? shouldRunAnimation;

  const _AnimationLimiterProvider({
    this.shouldRunAnimation,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  static _AnimationLimiterProvider? of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<_AnimationLimiterProvider>();
  }
}
