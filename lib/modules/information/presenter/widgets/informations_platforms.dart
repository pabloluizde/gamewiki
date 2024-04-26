import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:game_wiki_app/modules/information/presenter/cubit/information_cubit.dart';

class InformationsPlatforms extends StatelessWidget {
  const InformationsPlatforms({
    super.key,
    required this.cubit,
  });

  final InformationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: cubit.model.platforms
            .map(
              (e) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      e.platform.name,
                      style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
