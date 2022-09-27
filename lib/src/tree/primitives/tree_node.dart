import 'package:flutter/material.dart';

class TreeNode {
  final List<TreeNode>? children;
  final Widget content;
  final Key? key;
  final bool selected;
  final VoidCallback onTap;

  TreeNode({
    this.key,
    required this.selected,
    required this.onTap,
    this.children,
    Widget? content,
  }) : content = content ?? Container(width: 0, height: 0);
}
