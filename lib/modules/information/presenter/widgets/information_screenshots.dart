import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:game_wiki_app/modules/information/presenter/cubit/information_cubit.dart';

class InformationScreenshots extends StatelessWidget {
  const InformationScreenshots({
    super.key,
    required this.size,
    required this.cubit,
  });

  final Size size;
  final InformationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
          child: AutoSizeText(
            'Screenshots (${cubit.modelScreenshots.result.length})',
            style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        Container(
          height: size.height * 0.25,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cubit.modelScreenshots.result.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                        cubit.modelScreenshots.result[index].image),
                    height: size.height * 0.25,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
