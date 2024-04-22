import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomeOthersGamesCard extends StatelessWidget {
  const HomeOthersGamesCard({
    super.key,
    required this.image,
    required this.title,
    required this.size,
  });

  final String image;
  final String title;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: size.width * 0.2,
          height: size.height * 0.1,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                image,
              ),
            ),
          ),
        ),
        Container(
          width: 70,
          child: AutoSizeText(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 11,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ],
    );
  }
}
