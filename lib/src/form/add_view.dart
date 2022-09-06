import 'package:flutter/material.dart';

import '../../efficient_infra_ui.dart';

/// 输入框条目
class AddItem {
  AddItem({
    required this.controller,
    required this.name,
    this.onEditingComplete,
  });

  final TextEditingController controller;
  VoidCallback? onEditingComplete;
  final String name;
}

/// 添加视图
class AddView extends StatelessWidget {
  const AddView({
    Key? key,
    required this.items,
    required this.title,
    required this.add,
  }) : super(key: key);

  /// 输入框
  final List<AddItem> items;

  /// 标题
  final String title;

  /// 回调函数（用于添加）
  final VoidCallback add;

  List<Widget> _buildTiles() {
    for (var item in items) {
      item.onEditingComplete ??= add;
    }
    List<Widget> tiles = items
        .map<Widget>((e) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: e.controller,
                style: TextStyle(fontFamily: fontFamily),
                onEditingComplete: e.onEditingComplete,
                decoration: InputDecoration(
                  labelText: e.name,
                  hintText: '请输入${e.name}',
                  labelStyle: TextStyle(fontFamily: fontFamily),
                  hintStyle: TextStyle(fontFamily: fontFamily),
                ),
              ),
            ))
        .toList();
    tiles.add(
      FormSubmitButton(
        submit: add,
        text: '添加$title',
      ),
    );
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: _buildTiles(),
    );
  }
}
