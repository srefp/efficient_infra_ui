import 'package:flutter/material.dart';

import '../../efficient_infra_ui.dart';

/// 详情条目
class DetailItem {
  DetailItem({
    required this.controller,
    this.onEditingComplete,
    required this.name,
    required this.content,
  });

  final TextEditingController controller;
  VoidCallback? onEditingComplete;
  final String name;
  final String? content;
}

/// 详情视图（可编辑）
class DetailView extends StatelessWidget {
  const DetailView({
    Key? key,
    required this.items,
    required this.isEdit,
    required this.validateEdit,
  }) : super(key: key);

  final List<DetailItem> items;
  final bool isEdit;
  final VoidCallback validateEdit;

  List<Widget> _buildTiles() {
    for (var item in items) {
      item.onEditingComplete ??= validateEdit;
    }
    List<Widget> tiles = items
        .map<Widget>(
          (e) => isEdit
              ? CommonFormItem(
                  label: '${e.name}：',
                  hintText: '请输入${e.name}',
                  controller: e.controller,
                  onEditingComplete: e.onEditingComplete,
                )
              : CommonFormItem(
                  label: '${e.name}：',
                  contentBuilder: (BuildContext context) =>
                      CommonShowText(e.content),
                ),
        )
        .toList();
    tiles.add(isEdit
        ? Padding(
            padding: const EdgeInsets.only(top: 20),
            child: FormSubmitButton(
              submit: validateEdit,
              text: '修改',
            ),
          )
        : Container());
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildTiles(),
    );
  }
}
