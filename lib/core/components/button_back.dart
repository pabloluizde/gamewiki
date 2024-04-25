import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';

class InformationButtonBack extends StatelessWidget {
  const InformationButtonBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: () {
          Modular.to.pop();
        },
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blackDefaultColor.withOpacity(0.5)),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}
