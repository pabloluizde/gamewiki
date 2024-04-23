import 'package:flutter/material.dart';

class StateButton extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color? color;
  final Color? fontColor;
  final IconData? icon;
  const StateButton(
      {super.key,
      required this.width,
      required this.height,
      required this.radius,
      required this.icon,
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
          child: Icon(
        icon,
        color: Colors.white,
      )),
    );
  }
}
