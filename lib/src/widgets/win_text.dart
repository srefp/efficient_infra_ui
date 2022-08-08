import '../theme/theme.dart';

import 'package:flutter/material.dart';

class WinText extends StatelessWidget {
  const WinText(
    this.data, {
    Key? key,
    this.selectable = false,
  }) : super(key: key);

  final String data;
  final bool selectable;

  @override
  Widget build(BuildContext context) {
    return selectable
        ? SelectableText(
            data,
            style: TextStyle(fontFamily: fontFamily),
          )
        : Text(
            data,
            style: TextStyle(fontFamily: fontFamily),
          );
  }
}
