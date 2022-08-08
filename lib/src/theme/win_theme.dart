import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color _navItemUnselectedDarkColor = Color(0xFF363636);
const Color _navItemSelectedDarkColor = Color(0xFF444E55);
const Color _navItemUnselectedLightColor = Color(0xFFFFFFFF);
const Color _navItemSelectedLightColor = Color(0xFFC9C9C9);
const Color _listItemSelectedLightColor = Color(0xFFBABABA);
const Color _listItemUnSelectedLightColor = Color(0xFFFFFFFF);
const Color _listItemSelectedDarkColor = Color(0xFF515151);
const Color _listItemUnSelectedDarkColor = Color(0xFF303133);

/// 列表项目被选择颜色
Color get listItemSelectedColor =>
    Get.isDarkMode ? _listItemSelectedDarkColor : _listItemSelectedLightColor;

/// 列表项目未被选择颜色
Color get listItemUnSelectedColor =>
    Get.isDarkMode ? _listItemUnSelectedDarkColor : _listItemUnSelectedLightColor;

/// 导航栏未选中颜色
Color get navItemUnselectedColor =>
    Get.isDarkMode ? _navItemUnselectedDarkColor : _navItemUnselectedLightColor;

/// 导航栏选中颜色
Color get navItemSelectedColor =>
    Get.isDarkMode ? _navItemSelectedDarkColor : _navItemSelectedLightColor;

WindowButtonColors get buttonColors => Get.isDarkMode
    ? WindowButtonColors(
        iconNormal: const Color(0xFFFAFAFA),
        mouseOver: const Color(0xFF404040),
        mouseDown: const Color(0xFF303030),
        iconMouseOver: const Color(0xFFFFFFFF),
        iconMouseDown: const Color(0xFFFFFFFF),
      )
    : WindowButtonColors(
        iconNormal: const Color(0xFF000000),
        mouseOver: const Color(0xFFEDEDED),
        mouseDown: const Color(0xFFFAFAFA),
        iconMouseOver: const Color(0xFF000000),
        iconMouseDown: const Color(0xFF000000),
      );

WindowButtonColors get closeButtonColors => Get.isDarkMode
    ? WindowButtonColors(
        mouseOver: const Color(0xFFD32F2F),
        mouseDown: const Color(0xFFB71C1C),
        iconNormal: const Color(0xFFFAFAFA),
        iconMouseOver: Colors.white,
      )
    : WindowButtonColors(
        mouseOver: const Color(0xFFD32F2F),
        mouseDown: const Color(0xFFB71C1C),
        iconNormal: const Color(0xFF000000),
        iconMouseOver: Colors.white,
      );
