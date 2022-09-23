import 'package:flutter/material.dart';

class TreeNode {
  final List<TreeNode>? children;
  final Widget content;
  final Key? key;

  TreeNode({this.key, this.children, Widget? content})
      : content = content ?? Container(width: 0, height: 0);
}
