import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color? color;
  final Color? fontColor;
  final String text;
  final Function()? onTap;
  const DefaultButton({
    super.key,
    required this.width,
    required this.height,
    this.color = Colors.black,
    this.fontColor = Colors.white,
    this.radius = 0,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(radius)),
        child: Center(
            child: AutoSizeText(
          text,
          style: TextStyle(
              color: fontColor, fontSize: 15, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
