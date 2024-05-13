import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_wiki_app/core/components/expanded_appbar.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/profile/presenter/widgets/profile_image.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blackDefaultColor,
        body: ProviderScope(child: Builder(builder: (context) {
          return CustomScrollView(
            shrinkWrap: true,
            slivers: <Widget>[
              ExpandingAppBar(
                title: 'LuizGameplay'.toUpperCase(),
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: ProfileImage(),
                  ),
                ],
              ),
              SliverPadding(
                  padding: const EdgeInsets.all(0.0),
                  sliver: ProviderScope(
                    child: SliverList(
                      delegate: SliverChildListDelegate(
                        [],
                      ),
                    ),
                  )),
            ],
          );
        })));
  }
}
