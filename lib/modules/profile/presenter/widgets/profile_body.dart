import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_wiki_app/core/components/expanded_appbar.dart';
import 'package:game_wiki_app/core/components/expanded_text.dart';
import 'package:game_wiki_app/modules/profile/presenter/cubit/profile_cubit.dart';
import 'package:game_wiki_app/modules/profile/presenter/widgets/profile_image.dart';
import 'package:game_wiki_app/modules/profile/presenter/widgets/profile_review_list.dart';

class ProfileBody extends StatelessWidget {
  final Size size;
  final ProfileCubit cubit;
  const ProfileBody({
    super.key,
    required this.size,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        ExpandingAppBar(
          title: 'LuizGameplay'.toUpperCase(),
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
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
                  [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 5),
                      child: ExpandableText(
                        'Amo demais falar sobre jogos e tecnoligia em geral, também sou programador. Segue ai que vou fazer vários reviews soobre jogos.',
                        trimLines: 4,
                        fontSizes: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: SizedBox(
                        height: size.height * 0.34,
                        child: Column(
                          children: [
                            const AutoSizeText(
                              'Reviews',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            ProfileListReview(
                              cubit: cubit,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
