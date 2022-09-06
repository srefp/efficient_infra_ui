import 'package:flutter/material.dart';

/// 表单输入
class FormListView extends StatelessWidget {
  const FormListView({
    Key? key,
    required this.items,
  }) : super(key: key);

  /// 输入列表
  final List<InputItem> items;

  List<Widget> _buildTiles() {
    List<Widget> tiles = [];
    for (var item in items) {
      tiles.add(_InputTile(
        hintText: item.hintText,
        textEditingController: item.textEditingController,
        obscureText: item.obscureText,
      ));
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: _buildTiles(),
    );
  }
}

class InputItem {
  String hintText;
  TextEditingController textEditingController;
  bool obscureText;

  InputItem({
    required this.hintText,
    required this.textEditingController,
    this.obscureText = false,
  });
}

class _InputTile extends StatelessWidget {
  const _InputTile({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    required this.obscureText,
  }) : super(key: key);

  final String hintText;
  final TextEditingController textEditingController;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        obscureText: obscureText,
        style: TextStyle(
          fontSize: 20,
        ),
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
