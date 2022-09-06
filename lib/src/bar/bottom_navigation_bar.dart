import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';

/// 底部导航
class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({
    Key? key,
    required this.currentIndex,
    this.items,
  }) : super(key: key);

  final int currentIndex;
  final List<BottomNavItem>? items;

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

/// 底部导航项
class BottomNavItem {
  final String text;
  final String route;
  final IconData icon;

  BottomNavItem({
    required this.text,
    required this.route,
    required this.icon,
  });
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  // 自定义BottomAppBar
  Widget _tabBar(int index) {
    Color toggleableActiveColor = Theme.of(context).toggleableActiveColor;
    final currentItem = widget.items![index];
    //设置默认未选中的状态
    TextStyle style = TextStyle(
      fontSize: 12,
      color: Theme.of(context).unselectedWidgetColor,
      fontFamily: fontFamily,
    );
    var icon = Icon(
      currentItem.icon,
      color: Theme.of(context).unselectedWidgetColor,
    );
    if (widget.currentIndex == index) {
      // 选中的话
      style = TextStyle(
        fontSize: 13,
        color: toggleableActiveColor,
        fontFamily: fontFamily,
      );
      icon = Icon(
        currentItem.icon,
        color: toggleableActiveColor,
      );
    }
    // 构造返回的Widget
    Widget item = GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          icon,
          Text(
            currentItem.text,
            style: style,
          )
        ],
      ),
      onTap: () {
        if (widget.currentIndex != index) {
          Get.offAndToNamed(currentItem.route);
        }
      },
    );
    return item;
  }

  List<Widget> get boxes => List.generate(
        widget.items!.length,
        (index) => Expanded(
          flex: 1,
          child: SizedBox(
            height: 46,
            child: _tabBar(index),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 8,
      shape: const CircularNotchedRectangle(),
      child: Container(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: boxes,
        ),
      ),
    );
  }
}
