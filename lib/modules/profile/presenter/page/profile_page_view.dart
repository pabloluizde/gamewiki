import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_wiki_app/core/components/animation/animation_configuration.dart';
import 'package:game_wiki_app/core/components/animation/animation_limiter.dart';
import 'package:game_wiki_app/core/components/animation/fade_animation.dart';
import 'package:game_wiki_app/core/components/animation/scale_animation.dart';
import 'package:game_wiki_app/core/components/expanded_appbar.dart';
import 'package:game_wiki_app/core/components/expanded_text.dart';
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
                              'Amo demais falar sobre jogs e tecnoligia em geral, também sou programador. Segue ai que vou fazer vários reviews soobre jogos.',
                              trimLines: 4,
                              fontSizes: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: SizedBox(
                              height: 280,
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
                                  Expanded(
                                    child: AnimationLimiter(
                                      child: GridView.count(
                                        scrollDirection: Axis.horizontal,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5,
                                        childAspectRatio: 6 / 20,
                                        padding: const EdgeInsets.only(top: 30),
                                        shrinkWrap: true,
                                        crossAxisCount: 2,
                                        children: List.generate(
                                          30,
                                          (int index) {
                                            return AnimationConfiguration
                                                .staggeredGrid(
                                              position: index,
                                              duration: const Duration(
                                                  milliseconds: 375),
                                              columnCount: 2,
                                              child: ScaleAnimation(
                                                child: FadeInAnimation(
                                                  child: Container(
                                                    width: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: Colors.amberAccent,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
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
        })));
  }
}
