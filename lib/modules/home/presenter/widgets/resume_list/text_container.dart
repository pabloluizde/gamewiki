import 'package:flutter/material.dart';

class HomeTextCardLoading extends StatelessWidget {
  const HomeTextCardLoading({
    super.key,
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
              width: 60,
              height: 30,
              color: const Color.fromARGB(255, 0, 0, 0),
            )),
            const SizedBox(height: 10),
            Flexible(
              child: Container(
                width: 60,
                height: 30,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
