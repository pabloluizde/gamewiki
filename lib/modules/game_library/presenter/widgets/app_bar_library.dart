import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AppBarLibrary extends StatelessWidget {
  const AppBarLibrary({
    super.key,
    required this.size,
    required this.fontColor,
  });

  final Size size;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: size.height * 0.09,
          left: size.width * 0.03,
          right: size.width * 0.03,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                'Library'.toUpperCase(),
                strutStyle:
                    const StrutStyle(height: 2.5, forceStrutHeight: true),
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: fontColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
