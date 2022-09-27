import 'package:efficient_infra_ui/src/tree/primitives/tree_controller.dart';
import 'package:efficient_infra_ui/src/tree/primitives/tree_node.dart';
import 'package:flutter/material.dart';

import 'node_widget.dart';

Widget buildNodes({
  required Iterable<TreeNode> nodes,
  double? indent,
  required TreeController state,
  double? iconSize,
  required int depth,
  required int? selectedId,
  required Color? selectedColor,
}) {
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
          selectedId: selectedId,
          selectedColor: selectedColor,
        ),
    ],
  );
}
