import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/profile/presenter/cubit/profile_cubit.dart';
import 'package:game_wiki_app/modules/profile/presenter/widgets/profile_body.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cubit = Modular.get<ProfileCubit>();
    return Scaffold(
      backgroundColor: AppColors.blackDefaultColor,
      body: ProviderScope(
        child: Builder(
          builder: (context) {
            return ProfileBody(
              size: size,
              cubit: cubit,
            );
          },
        ),
      ),
    );
  }
}
