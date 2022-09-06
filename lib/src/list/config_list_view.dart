import 'dart:async';

import 'package:flutter/material.dart';

import '../../efficient_infra_ui.dart';

class ConfigListView extends StatelessWidget {
  const ConfigListView({
    Key? key,
    this.crossAxisCount = 1,
    this.nameWidth = 130,
    required this.items,
    required this.callback,
    this.padding = const EdgeInsets.symmetric(vertical: 1),
  }) : super(key: key);

  /// 行数
  final int crossAxisCount;

  /// 配置名字的宽度
  final double nameWidth;

  /// 配置项
  final List<ConfigItem> items;

  /// 编辑回调函数
  final SaveKV callback;

  /// 列表padding
  final EdgeInsetsGeometry padding;

  List<Widget> get itemView => items
      .map(
        (e) => _ConfigTile(
          item: e,
          nameWidth: nameWidth,
          save: callback,
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    if (crossAxisCount == 1) {
      return ListView(
        padding: padding,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: itemView,
      );
    } else {
      return LayoutBuilder(builder: (context, constraints) {
        final itemWidth = constraints.biggest.width / 2;
        return GridView.count(
          padding: padding,
          childAspectRatio: (itemWidth / 50),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 20,
          children: itemView,
        );
      });
    }
  }
}

class _ConfigTile extends StatelessWidget {
  _ConfigTile({
    Key? key,
    required this.item,
    required this.nameWidth,
    required this.save,
  }) : super(key: key);

  final double nameWidth;
  final ConfigItem item;
  final TextEditingController _controller = TextEditingController();
  final SaveKV save;

  @override
  Widget build(BuildContext context) {
    _controller.text = item.value;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: nameWidth,
          child: WinText(item.comment),
        ),
        Expanded(
          child: DebounceTextField(
            item: item,
            controller: _controller,
            save: save,
          ),
        ),
      ],
    );
  }
}

Function(String) debounce(void Function(String) fn, {int t = 1}) {
  Timer? _debounce;
  return (String value) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(Duration(seconds: t), () {
      fn.call(value);
    });
  };
}

/// 定义回调函数
typedef SaveKV = void Function(String, String);

/// 编辑停止1s后自动保存
class DebounceTextField extends StatelessWidget {
  const DebounceTextField({
    Key? key,
    required this.item,
    required this.controller,
    this.save,
  }) : super(key: key);

  final ConfigItem item;
  final TextEditingController controller;
  final SaveKV? save;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: item.hide,
      controller: controller,
      onChanged: debounce((String value) {
        item.value = value;
        save?.call(item.key, value);
      }),
    );
  }
}

/// 配置项
class ConfigItem {
  ConfigItem({
    required this.key,
    required this.value,
    required this.comment,
    this.hide = false,
  });

  final String key;
  String value;
  final String comment;
  final bool hide;
}
