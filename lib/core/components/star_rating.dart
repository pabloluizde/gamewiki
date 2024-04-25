import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color? color;

  StarRating({this.starCount = 5, this.rating = .0, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(starCount, (index) {
      Icon icon;
      if (index >= rating) {
        icon = Icon(
          Icons.star_border,
          color: Theme.of(context).primaryColor,
          size: 20,
        );
      } else if (index > rating - 1 && index < rating) {
        icon = Icon(
          Icons.star_half,
          color: color ?? Theme.of(context).primaryColor,
          size: 20,
        );
      } else {
        icon = Icon(
          Icons.star,
          color: color ?? Theme.of(context).primaryColor,
          size: 20,
        );
      }
      return InkResponse(
        child: icon,
      );
    }));
  }
}
