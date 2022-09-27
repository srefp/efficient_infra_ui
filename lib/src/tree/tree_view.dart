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

  /// 点击事件
  final ValueChanged<int> onTap;

  final int? selectedId;

  final Color? selectedColor;

  final Color? backgroundColor;

  TreeView({
    Key? key,
    required List<TreeNode> nodes,
    this.indent = 14,
    this.iconSize,
    this.treeController,
    required this.onTap,
    int? currentId,
    required this.selectedId,
    this.selectedColor = const Color(0xFFF1F2F3),
    this.backgroundColor = Colors.white,
  })  : nodes = copyTreeNodes(nodes, currentId, onTap),
        super(key: key);

  @override
  State<TreeView> createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  TreeController? _controller;

  @override
  void initState() {
    _controller = widget.treeController ??
        TreeController(
          selectedColor: widget.selectedColor,
          backgroundColor: widget.backgroundColor,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildNodes(
      nodes: widget.nodes,
      indent: widget.indent,
      state: _controller!,
      iconSize: widget.iconSize,
      depth: 1,
      selectedId: widget.selectedId,
    );
  }
}
