import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class InformationsLoadingPlatforms extends StatelessWidget {
  const InformationsLoadingPlatforms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var list = ['', '', '', ''];
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 170, 170, 170),
      highlightColor: const Color.fromARGB(152, 193, 193, 193),
      enabled: true,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: list
              .map(
                (e) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
