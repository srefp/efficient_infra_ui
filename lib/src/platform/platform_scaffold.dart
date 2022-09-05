import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../efficient_infra_ui.dart';

/// 平台判断
class PlatformScaffold extends StatelessWidget {
  const PlatformScaffold({
    Key? key,
    required this.body,
    required this.appBar,
    required this.bottomNavigationBar,
    this.drawer,
    this.floatingActionButton,
    this.titleBarActionList = const <Widget>[],
  }) : super(key: key);

  final AppBar appBar;
  final Widget body;
  final Widget bottomNavigationBar;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final List<Widget> titleBarActionList;

  Widget _windows(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: WindowBorder(
        width: 1,
        color: Colors.white,
        child: WindowsArea(
          header: TitleBar(
            titleBarActionList: titleBarActionList,
          ),
          body: body,
          footer: bottomNavigationBar,
        ),
      ),
    );
  }

  Widget _android(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: appBar,
      body: body,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isWindows) {
      return _windows(context);
    } else if (Platform.isAndroid) {
      return _android(context);
    }
    return Container();
  }
}
