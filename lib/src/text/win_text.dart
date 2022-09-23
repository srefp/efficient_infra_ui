import 'package:flutter/material.dart';

import '../theme/theme.dart';

class WinText extends StatelessWidget {
  const WinText(
    this.data, {
    Key? key,
    this.selectable = false,
    this.textAlign = TextAlign.start,
    this.style,
  }) : super(key: key);

  final String data;
  final bool selectable;
  final TextAlign textAlign;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    TextStyle style = this.style?.copyWith(fontFamily: fontFamily) ??
        TextStyle(fontFamily: fontFamily);
    return selectable
        ? SelectableText(
            data,
            style: style,
            textAlign: textAlign,
          )
        : Text(
            data,
            style: style,
            textAlign: textAlign,
          );
  }
}
