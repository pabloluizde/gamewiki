import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ButtonLoading extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color? color;
  final Color? fontColor;
  const ButtonLoading(
      {super.key,
      required this.width,
      required this.height,
      required this.radius,
      this.color,
      this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: LoadingAnimationWidget.waveDots(
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
