import 'package:flutter/material.dart';
import 'package:game_wiki_app/core/themes/app_colors.dart';

class TextFieldDefault extends StatefulWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Color? labelColor;
  final Color? hintColor;
  final bool labelOn;
  final Color? textColor;
  final Color? cursorColor;
  final double radius;
  final double fontSize;
  const TextFieldDefault({
    super.key,
    this.label = '',
    this.hint = '',
    required this.controller,
    this.onChanged,
    this.isPassword = false,
    this.labelColor = Colors.white,
    this.hintColor = Colors.white,
    this.radius = 35,
    this.fontSize = 10,
    this.cursorColor = Colors.white,
    this.labelOn = true,
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
        onChanged: widget.onChanged,
        cursorHeight: 15,
        cursorWidth: 1.3,
        controller: widget.controller,
        cursorColor: widget.cursorColor,
        style: TextStyle(
          color: widget.textColor,
          fontSize: widget.fontSize,
        ),
        obscureText: hiden,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(
            fontSize: 13,
            color: widget.hintColor,
          ),
          contentPadding: widget.fontSize > 12
              ? EdgeInsets.symmetric(horizontal: 10)
              : null,
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
          label: widget.labelOn
              ? Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 13,
                    color: widget.labelColor,
                  ),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            borderSide: BorderSide(color: AppColors.purpleNeonColor, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
        ),
      ),
    );
  }
}
