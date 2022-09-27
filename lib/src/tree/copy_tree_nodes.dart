import 'package:efficient_infra_ui/src/tree/primitives/key_provider.dart';
import 'package:efficient_infra_ui/src/tree/primitives/tree_node.dart';
import 'package:flutter/material.dart';

/// 将节点复制到不可修改的列表，分配键并检查是否重复
List<TreeNode> copyTreeNodes(
  List<TreeNode>? nodes,
  Key? currentKey,
  ValueChanged<Key> onTap,
) {
  return _copyNodesRecursively(nodes, KeyProvider(), currentKey, onTap)!;
}

List<TreeNode>? _copyNodesRecursively(
  List<TreeNode>? nodes,
  KeyProvider keyProvider,
  Key? currentKey,
  ValueChanged<Key> onTap,
) {
  if (nodes == null) {
    return null;
  }
  return List.unmodifiable(
    nodes.map(
      (e) => TreeNode(
        key: keyProvider.key(e.key),
        selected: keyProvider.key(e.key) == currentKey,
        content: e.content,
        children: _copyNodesRecursively(
          e.children,
          keyProvider,
          currentKey,
          onTap,
        ),
        onTap: () {},
      ),
    ),
  );
}
