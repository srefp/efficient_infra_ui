import 'package:flutter/material.dart';

import '../../efficient_infra_ui.dart';

class SearchBar extends StatefulWidget {
  /// 展示位置按钮
  final bool? showLocation;

  /// 回退按钮函数
  final void Function()? goBackCallback;

  /// 搜索框输入值
  final String? inputValue;

  /// 输入框默认值
  final String? defaultInputValue;

  /// 取消按钮
  final void Function()? onCancel;

  /// 展示地图按钮
  final bool? showMap;

  /// 用户点击搜索框触发
  final void Function()? onSearch;

  /// 用户输入关键词后，点击键盘的搜索键触发
  final ValueChanged<String>? onSearchSubmit;

  const SearchBar({
    Key? key,
    this.showLocation,
    this.goBackCallback,
    this.inputValue = '',
    this.defaultInputValue = '请输入搜索词',
    this.onCancel,
    this.showMap,
    this.onSearch,
    this.onSearchSubmit,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _searchWord = '';
  late TextEditingController _controller;
  late FocusNode _focusNode;

  void _onClean() {
    _controller.clear();
    setState(() {
      _searchWord = '';
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.inputValue);
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.showLocation != null)
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.room,
                    color: Colors.green,
                    size: 16,
                  ),
                  Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (widget.goBackCallback != null)
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: widget.goBackCallback,
              child: Icon(
                Icons.chevron_left,
                color: secondaryTextColor,
              ),
            ),
          ),
        Expanded(
          child: Container(
            height: 34,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(17)),
            margin: EdgeInsets.only(right: 10),
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              onTap: () {
                if (widget.onSearchSubmit == null) {
                  _focusNode.unfocus();
                }
                widget.onSearch?.call();
              },
              onSubmitted: widget.onSearchSubmit,
              textInputAction: TextInputAction.search,
              onChanged: (value) {
                setState(() {
                  _searchWord = value;
                });
              },
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: -10),
                hintText: widget.defaultInputValue,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                icon: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Icon(
                    Icons.search,
                    size: 18,
                    color: Colors.grey,
                  ),
                ),
                suffixIcon: GestureDetector(
                  onTap: _onClean,
                  child: Icon(
                    Icons.clear,
                    size: 18,
                    color: _searchWord == '' ? Colors.grey[200] : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (widget.onCancel != null)
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: widget.onCancel,
              child: Text(
                '取消',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        if (widget.showMap != null)
          CommonImage('assets/icons/widget_search_bar_map.png'),
      ],
    );
  }
}
