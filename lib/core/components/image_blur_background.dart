import 'dart:ui';

import 'package:flutter/material.dart';

List<Widget> buildBlurredImage(List<Widget> l) {
  List<Widget> list = [];
  list.addAll(l);
  double sigmaX = 0;
  double sigmaY = 0.1;
  for (int i = 230; i < 385; i += 5) {
    list.add(Positioned(
      top: i.toDouble(),
      bottom: 0,
      left: 0,
      right: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: sigmaX,
            sigmaY: sigmaY,
          ),
          child: Container(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      ),
    ));
    sigmaX += 0.2;
    sigmaY += 0.3;
  }
  return list;
}
