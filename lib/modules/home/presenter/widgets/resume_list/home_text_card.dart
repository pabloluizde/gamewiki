import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomeTextCard extends StatelessWidget {
  const HomeTextCard({
    super.key,
    required this.title,
    required this.rating,
  });

  final String title;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: AutoSizeText(
                title,
                style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  rating >= 3
                      ? Icons.star_rate_rounded
                      : Icons.star_half_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                AutoSizeText(
                  '${rating}',
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
