import 'package:flutter/material.dart';

/// 树状态（节点是否展开）的控制器
class TreeController {
  bool _allNodesExpanded;
  final Map<Key, bool> _expanded = <Key, bool>{};
  Key? _selectedRowKey;

  TreeController({allNodesExpanded = true, selectedRowKey})
      : _allNodesExpanded = allNodesExpanded,
        _selectedRowKey = selectedRowKey;

  bool get allNodesExpanded => _allNodesExpanded;

  bool isNodeExpanded(Key key) {
    return _expanded[key] ?? _allNodesExpanded;
  }

  void toggleNodeExpanded(Key key) {
    _expanded[key] = !isNodeExpanded(key);
  }

  void expandAll() {
    _allNodesExpanded = true;
    _expanded.clear();
  }

  void collapseAll() {
    _allNodesExpanded = false;
    _expanded.clear();
  }

  void expandNode(Key key) {
    _expanded[key] = true;
  }

  void collapseNode(Key key) {
    _expanded[key] = false;
  }

  void selectRow(Key key) {
    this._selectedRowKey = key;
  }
}
