import 'package:flutter/material.dart';

class ImagePainel extends StatelessWidget {
  const ImagePainel({
    super.key,
    required this.size,
    required this.image,
  });

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}
