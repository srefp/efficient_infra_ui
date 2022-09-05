import 'package:efficient_infra_ui/efficient_infra_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 抽屉项
class DrawerItem {
  final IconData icon;
  final String title;
  final String route;

  DrawerItem({
    required this.icon,
    required this.title,
    required this.route,
  });
}

/// 抽屉
class CommonDrawer extends StatelessWidget {
  const CommonDrawer({
    Key? key,
    this.header,
    this.footer,
    required this.items,
  }) : super(key: key);

  final Widget? header;
  final Widget? footer;
  final List<DrawerItem> items;

  List<Widget> get tiles => items
      .map(
        (e) => ListTile(
          leading: Icon(e.icon),
          title: WinText(e.title),
          onTap: () {
            Get.toNamed(e.route);
          },
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
            ),
            child: header,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0),
              children: tiles,
            ),
          ),
          footer ?? Container(),
        ],
      ),
    );
  }
}
