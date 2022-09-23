import 'package:efficient_infra_ui/src/tree/primitives/tree_controller.dart';
import 'package:efficient_infra_ui/src/tree/primitives/tree_node.dart';
import 'package:flutter/material.dart';

import 'node_widget.dart';

Widget buildNodes(
  Iterable<TreeNode> nodes,
  double? indent,
  TreeController state,
  double? iconSize,
  int depth,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for (var node in nodes)
        NodeWidget(
          treeNode: node,
          indent: indent,
          state: state,
          iconSize: iconSize,
          depth: depth,
        ),
    ],
  );
}
