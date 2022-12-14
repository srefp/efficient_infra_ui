import 'package:efficient_infra_ui/src/tree/builder.dart';
import 'package:efficient_infra_ui/src/tree/primitives/tree_controller.dart';
import 'package:efficient_infra_ui/src/tree/primitives/tree_node.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// 树控件中的一行
/// TODO: 利用FocusNode完成获取焦点和失去焦点的颜色变化
class NodeWidget extends StatefulWidget {
  final TreeNode treeNode;
  final double? indent;
  final double? iconSize;
  final TreeController state;
  final int depth;
  final int? selectedId;

  const NodeWidget({
    Key? key,
    required this.treeNode,
    this.indent,
    this.iconSize,
    required this.state,
    required this.depth,
    required this.selectedId,
  }) : super(key: key);

  @override
  State<NodeWidget> createState() => _NodeWidgetState();
}

class _NodeWidgetState extends State<NodeWidget> {
  bool get _isLeaf =>
      widget.treeNode.children == null || widget.treeNode.children!.isEmpty;

  bool get _isExpanded => widget.state.isNodeExpanded(widget.treeNode.id);

  @override
  Widget build(BuildContext context) {
    var icon = _isLeaf
        ? null
        : _isExpanded
            ? Icons.expand_more
            : Icons.chevron_right;

    var onIconPressed = _isLeaf
        ? null
        : () =>
            setState(() => widget.state.toggleNodeExpanded(widget.treeNode.id));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(builder: (context, constraints) {
          return RawGestureDetector(
            gestures: {
              AllowMultipleGestureRecognizer:
                  GestureRecognizerFactoryWithHandlers<
                      AllowMultipleGestureRecognizer>(
                () => AllowMultipleGestureRecognizer(),
                (AllowMultipleGestureRecognizer instance) {
                  instance.onTap = () {
                    widget.treeNode.onTap.call();
                  };
                },
              )
            },
            child: Container(
              color: widget.selectedId == widget.treeNode.id
                  ? widget.state.selectedColor
                  : widget.state.backgroundColor,
              width: constraints.maxWidth,
              child: Padding(
                padding: EdgeInsets.only(left: widget.depth * widget.indent!),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      splashRadius: 10,
                      onPressed: onIconPressed,
                      icon: Icon(icon),
                      padding: EdgeInsets.zero,
                      iconSize: widget.iconSize ?? 20,
                      constraints: BoxConstraints(
                        maxWidth: 20,
                        maxHeight: 20,
                      ),
                    ),
                    widget.treeNode.content,
                  ],
                ),
              ),
            ),
          );
        }),
        if (_isExpanded && !_isLeaf)
          buildNodes(
            nodes: widget.treeNode.children!,
            indent: widget.indent,
            state: widget.state,
            iconSize: widget.iconSize,
            depth: widget.depth + 1,
            selectedId: widget.selectedId,
          ),
      ],
    );
  }
}

class AllowMultipleGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
