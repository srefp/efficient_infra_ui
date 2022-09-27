import 'package:efficient_infra_ui/src/tree/primitives/key_provider.dart';
import 'package:efficient_infra_ui/src/tree/primitives/tree_node.dart';
import 'package:flutter/material.dart';

/// 将节点复制到不可修改的列表，分配键并检查是否重复
List<TreeNode> copyTreeNodes(
  List<TreeNode>? nodes,
  int? currentId,
  ValueChanged<int> onTap,
) {
  return _copyNodesRecursively(nodes, KeyProvider(), currentId, onTap)!;
}

List<TreeNode>? _copyNodesRecursively(
  List<TreeNode>? nodes,
  KeyProvider keyProvider,
  int? currentId,
  ValueChanged<int> onTap,
) {
  if (nodes == null) {
    return null;
  }
  return List.unmodifiable(
    nodes.map(
      (e) => TreeNode(
        id: e.id,
        content: e.content,
        children: _copyNodesRecursively(
          e.children,
          keyProvider,
          currentId,
          onTap,
        ),
        onTap: () {
          onTap.call(e.id);
        },
      ),
    ),
  );
}
