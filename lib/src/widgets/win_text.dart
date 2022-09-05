import 'dart:io';

import 'package:flutter/material.dart';

import '../theme/theme.dart';

class WinText extends StatelessWidget {
  const WinText(
    this.data, {
    Key? key,
    this.selectable = false,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  final String data;
  final bool selectable;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return selectable
        ? SelectableText(
            data,
            style: TextStyle(fontFamily: fontFamily),
            textAlign: textAlign,
          )
        : Text(
            data,
            style: TextStyle(fontFamily: fontFamily),
            textAlign: textAlign,
          );
  }
}
