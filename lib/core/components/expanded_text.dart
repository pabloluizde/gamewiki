import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText(
    this.text, {
    this.fontSizes = 15,
    this.trimLines = 2,
    this.padding = 30,
  })  : assert(text != null),
        super();

  final String text;
  final int trimLines;
  final double? fontSizes;
  final double padding;

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  bool _readMore = true;
  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    final colorClickableText = Color.fromARGB(255, 175, 175, 175);
    TextSpan link = TextSpan(
        text: _readMore ? " ... View more" : " Show less",
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        recognizer: TapGestureRecognizer()..onTap = _onTapLink);
    Widget result = Padding(
      padding: const EdgeInsets.only(
        right: 0.0,
        top: 10,
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          assert(constraints.hasBoundedWidth);
          final double maxWidth = constraints.maxWidth;
          final text = TextSpan(
            text: widget.text,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
          TextPainter textPainter = TextPainter(
            text: link,
            textDirection: TextDirection.ltr,
            maxLines: widget.trimLines,
            ellipsis: '...',
          );
          textPainter.layout(minWidth: 0, maxWidth: maxWidth);
          final linkSize = textPainter.size;
          textPainter.text = text;
          textPainter.layout(minWidth: 0, maxWidth: maxWidth);
          final textSize = textPainter.size;
          int endIndex = 0;
          final pos = textPainter.getPositionForOffset(Offset(
            textSize.width - linkSize.width,
            textSize.height,
          ));
          if (pos.offset != 0) {
            endIndex = textPainter.getOffsetBefore(pos.offset)!;
          }

          var textSpan;
          if (textPainter.didExceedMaxLines) {
            textSpan = TextSpan(
              text:
                  _readMore ? widget.text.substring(0, endIndex) : widget.text,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: colorClickableText),
              recognizer: TapGestureRecognizer()..onTap = _onTapLink,
              children: <TextSpan>[link],
            );
          } else {
            textSpan = TextSpan(
              text: widget.text,
              recognizer: TapGestureRecognizer()..onTap = _onTapLink,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: colorClickableText),
            );
          }
          return RichText(
            softWrap: true,
            overflow: TextOverflow.clip,
            text: textSpan,
          );
        },
      ),
    );
    return result;
  }
}
