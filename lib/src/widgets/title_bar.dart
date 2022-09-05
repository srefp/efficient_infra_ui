import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import '../../efficient_infra_ui.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    Key? key,
    this.titleBarActionList = const <Widget>[],
  }) : super(key: key);

  final List<Widget> titleBarActionList;

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Row(
        children: [
          Expanded(
            child: MoveWindow(
              child: Row(
                children: titleBarActionList,
              ),
            ),
          ),
          WindowButtons(),
        ],
      ),
    );
  }
}
