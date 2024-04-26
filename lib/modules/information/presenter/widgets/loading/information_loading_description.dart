import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class InformationsLoadingDescription extends StatelessWidget {
  final Size size;
  const InformationsLoadingDescription({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 170, 170, 170),
      highlightColor: const Color.fromARGB(152, 193, 193, 193),
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 10,
              width: size.width * 1,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 10,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 10,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 10,
              width: size.width * 0.93,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 10,
              width: size.width * 0.85,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 10,
              width: size.width * 1,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
