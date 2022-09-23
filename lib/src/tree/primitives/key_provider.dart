import 'package:flutter/material.dart';

class _TreeNodeKey extends ValueKey {
  _TreeNodeKey(dynamic value) : super(value);
}

/// 提供唯一键、判重
class KeyProvider {
  int _nextIndex = 0;
  final Set<Key> _keys = <Key>{};

  /// 如果 originalKey 为空，生成新的 key ，否则验证这个 key 在之前没有出现过
  Key key(Key? originalKey) {
    if (originalKey == null) {
      return _TreeNodeKey(_nextIndex++);
    }
    if (_keys.contains(originalKey)) {
      throw ArgumentError('There should not be nodes with the same keys. '
          'Duplicate value found: $originalKey.');
    }
    _keys.add(originalKey);
    return originalKey;
  }
}
