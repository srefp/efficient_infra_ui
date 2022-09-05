import 'package:flutter/material.dart';

class WindowsArea extends StatelessWidget {
  const WindowsArea({
    Key? key,
    required this.header,
    required this.body,
    this.footer,
  }) : super(key: key);

  final Widget header;
  final Widget body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header,
        Expanded(
          child: body,
        ),
        footer ?? Container(),
      ],
    );
  }
}
