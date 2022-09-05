import 'package:flutter/material.dart';

class FooterLayout extends StatelessWidget {
  const FooterLayout({required this.child, required this.footer, Key? key})
      : super(key: key);

  final Widget child;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: child),
        footer,
      ],
    );
  }
}
