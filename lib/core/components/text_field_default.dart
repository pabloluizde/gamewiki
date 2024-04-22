import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';

class TextFieldDefault extends StatefulWidget {
  final String label;
  final bool isPassword;
  final TextEditingController controller;
  final Color? labelColor;
  final Color? textColor;
  const TextFieldDefault({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.labelColor = Colors.white,
    this.textColor = Colors.white,
  });

  @override
  State<TextFieldDefault> createState() => _TextFieldDefaultState();
}

class _TextFieldDefaultState extends State<TextFieldDefault> {
  late bool hiden;

  @override
  void initState() {
    hiden = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: widget.controller,
        cursorColor: Colors.white,
        style: TextStyle(color: widget.textColor, fontSize: 10),
        obscureText: hiden,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      hiden = !hiden;
                    });
                  },
                  icon: Icon(
                    hiden
                        ? Icons.remove_red_eye_outlined
                        : Icons.visibility_off_outlined,
                    size: 20,
                  ),
                )
              : null,
          label: Text(
            widget.label,
            style: TextStyle(
              fontSize: 13,
              color: widget.labelColor,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(35)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(35)),
            borderSide: BorderSide(color: AppColors.purpleNeonColor, width: 1),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(35)),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
        ),
      ),
    );
  }
}
