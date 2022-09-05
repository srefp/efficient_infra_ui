import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import '../../efficient_infra_ui.dart';

/// 在AppBar中使用的，可以移动的Title
class MovableTitle extends StatelessWidget {
  const MovableTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: 60,
        margin: const EdgeInsets.only(right: 6),
        constraints: BoxConstraints(
          maxWidth: constraints.biggest.width,
        ),
        child: MoveWindow(
          child: Center(
            child: WinText(text),
          ),
        ),
      );
    });
  }
}
