import 'dart:math';

import 'package:flutter/material.dart';

class ExpandArrow extends StatelessWidget {
  const ExpandArrow({
    Key? key,
    required bool isExpanded,
  }) : _isExpanded = isExpanded, super(key: key);

  final bool _isExpanded;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(end: _isExpanded ? 0.0 : pi / 2),
      curve: Curves.ease,
      duration: const Duration(milliseconds: 300),
      builder: (context, double value, child) {
        return Transform.rotate(
          angle: value,
          alignment: Alignment.center,
          child: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
