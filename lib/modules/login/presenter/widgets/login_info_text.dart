import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LoginTextInfo extends StatelessWidget {
  final String title;
  final String textCaps;
  const LoginTextInfo({
    super.key,
    required this.title,
    required this.textCaps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AutoSizeText(
          title,
          style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        AutoSizeText(
          textCaps,
          strutStyle: const StrutStyle(height: 3, forceStrutHeight: true),
          style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ],
    );
  }
}
