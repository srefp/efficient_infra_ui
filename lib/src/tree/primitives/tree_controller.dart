/// 树状态（节点是否展开）的控制器
class TreeController {
  bool _allNodesExpanded;
  final Map<int, bool> _expanded = <int, bool>{};

  TreeController({allNodesExpanded = true, selectedRowKey})
      : _allNodesExpanded = allNodesExpanded;

  bool get allNodesExpanded => _allNodesExpanded;

  bool isNodeExpanded(int id) {
    return _expanded[id] ?? _allNodesExpanded;
  }

  void toggleNodeExpanded(int id) {
    _expanded[id] = !isNodeExpanded(id);
  }

  void expandAll() {
    _allNodesExpanded = true;
    _expanded.clear();
  }

  void collapseAll() {
    _allNodesExpanded = false;
    _expanded.clear();
  }

  void expandNode(int id) {
    _expanded[id] = true;
  }

  void collapseNode(int id) {
    _expanded[id] = false;
  }
}
