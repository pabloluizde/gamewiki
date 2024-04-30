import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';
import 'package:game_wiki_app/modules/login/presenter/cubit/login_state.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DefaultLoginButton extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color? color;
  final Color? fontColor;
  final String text;
  final Object? state;
  final Function()? onTap;
  const DefaultLoginButton({
    super.key,
    required this.width,
    required this.height,
    this.color = Colors.black,
    this.fontColor = Colors.white,
    this.radius = 0,
    required this.text,
    required this.onTap,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: state is! LoginInitialState ? () {} : onTap,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: state is LoginSuccessState
                  ? AppColors.greenSuccess
                  : state is LoginErrorState
                      ? Colors.red
                      : color,
              borderRadius: BorderRadius.circular(radius)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state is LoginInitialState)
                AutoSizeText(
                  text,
                  style: TextStyle(
                      color: fontColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              else if (state is LoginLoadingState)
                Center(
                  child: LoadingAnimationWidget.waveDots(
                    color: Colors.white,
                    size: 30,
                  ),
                )
              else if (state is LoginErrorState)
                const Center(
                    child: Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                ))
              else if (state is LoginSuccessState)
                const Center(
                    child: Icon(
                  Icons.check,
                  color: Colors.white,
                )),
            ],
          )),
    );
  }
}
