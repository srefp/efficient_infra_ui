import 'package:efficient_infra_ui/efficient_infra_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 路由项目
class NavItem {
  /// 名称
  String text;

  /// 路由
  String route;

  NavItem({
    required this.text,
    required this.route,
  });
}

/// windows平台的导航栏
class WinNavigation extends StatefulWidget {
  const WinNavigation({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<NavItem> items;

  @override
  State<WinNavigation> createState() => _WinNavigationState();
}

class _WinNavigationState extends State<WinNavigation> {
  List<Widget> get tiles => widget.items
      .map((e) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: _NavTile(
            text: e.text,
            onTap: () {
              Get.toNamed(e.route);
            }),
      ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: tiles,
    );
  }
}

class _NavTile extends StatelessWidget {
  const _NavTile({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  /// 文本
  final String text;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: WinText(text),
    );
  }
}
