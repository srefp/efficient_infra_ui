import 'package:efficient_infra_ui/src/tree/builder.dart';
import 'package:efficient_infra_ui/src/tree/copy_tree_nodes.dart';
import 'package:efficient_infra_ui/src/tree/primitives/tree_controller.dart';
import 'package:efficient_infra_ui/src/tree/primitives/tree_node.dart';
import 'package:flutter/material.dart';

/// 具有可折叠和可扩展的树视图
class TreeView extends StatefulWidget {
  /// 根节点列表
  final List<TreeNode> nodes;

  /// 层之间的水平缩进
  final double? indent;

  /// icon大小
  final double? iconSize;

  /// 管理树状态的控制器
  final TreeController? treeController;

  TreeView({
    Key? key,
    required List<TreeNode> nodes,
    this.indent = 14,
    this.iconSize,
    this.treeController,
  })  : nodes = copyTreeNodes(nodes),
        super(key: key);

  @override
  State<TreeView> createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  TreeController? _controller;

  @override
  void initState() {
    _controller = widget.treeController ?? TreeController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildNodes(
      widget.nodes,
      widget.indent,
      _controller!,
      widget.iconSize,
      1,
    );
  }
}
