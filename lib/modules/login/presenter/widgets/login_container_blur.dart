import 'dart:ui';
import 'package:flutter/material.dart';

class LoginContainerBlur extends StatelessWidget {
  final Widget widget;
  const LoginContainerBlur({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 640,
      bottom: 0,
      left: 0,
      right: 0,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        clipBehavior: Clip.hardEdge,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 15,
            sigmaY: 15,
          ),
          child: Container(
            color: Colors.black.withOpacity(0.2),
            child: widget,
          ),
        ),
      ),
    );
  }
}
