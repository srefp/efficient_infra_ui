import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import '../../efficient_infra_ui.dart';

class WindowButtons extends StatelessWidget {
  const WindowButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(
          colors: buttonColors,
        ),
        MaximizeWindowButton(
          colors: buttonColors,
        ),
        CloseWindowButton(
          colors: closeButtonColors,
          onPressed: () {
            appWindow.hide();
          },
        ),
      ],
    );
  }
}
