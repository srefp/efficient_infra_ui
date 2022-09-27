import 'package:flutter/material.dart';

class TreeNode {
  final List<TreeNode>? children;
  final Widget content;
  final int id;
  final VoidCallback onTap;

  TreeNode({
    required this.id,
    required this.onTap,
    this.children,
    Widget? content,
  }) : content = content ?? Container(width: 0, height: 0);
}
