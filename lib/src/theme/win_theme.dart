import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color navItemUnselectedDarkColor = Color(0xFF363636);
const Color navItemSelectedDarkColor = Color(0xFF444E55);
const Color navItemUnselectedLightColor = Color(0xFFFFFFFF);
const Color navItemSelectedLightColor = Color(0xFFC9C9C9);
const Color listItemSelectedLightColor = Color(0xFFBABABA);
const Color listItemUnSelectedLightColor = Color(0xFFFFFFFF);
const Color listItemSelectedDarkColor = Color(0xFF515151);
const Color listItemUnSelectedDarkColor = Color(0xFF303133);

/// 列表项目被选择颜色
Color get listItemSelectedColor =>
    Get.isDarkMode ? listItemSelectedDarkColor : listItemSelectedLightColor;

/// 列表项目未被选择颜色
Color get listItemUnSelectedColor =>
    Get.isDarkMode ? listItemUnSelectedDarkColor : listItemUnSelectedLightColor;

/// 导航栏未选中颜色
Color get navItemUnselectedColor =>
    Get.isDarkMode ? navItemUnselectedDarkColor : navItemUnselectedLightColor;

/// 导航栏选中颜色
Color get navItemSelectedColor =>
    Get.isDarkMode ? navItemSelectedDarkColor : navItemSelectedLightColor;

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
