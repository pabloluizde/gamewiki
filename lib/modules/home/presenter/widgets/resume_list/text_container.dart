import 'package:flutter/material.dart';

class HomeTextCardLoading extends StatelessWidget {
  final Size size;
  const HomeTextCardLoading({
    super.key,
    required this.size,
  });

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
            const SizedBox(height: 10),
            Flexible(
                child: Container(
              width: size.width * 0.5,
              height: size.height * 0.025,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(5)),
            )),
            const SizedBox(height: 10),
            Flexible(
              child: Container(
                width: size.width * 0.2,
                height: size.height * 0.025,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(5)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
