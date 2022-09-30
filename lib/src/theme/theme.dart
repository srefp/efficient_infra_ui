import 'package:efficient_infra_ui/efficient_infra_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4E5AE8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFFF4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkPrimaryColor = Color(0xFF303030);
const Color darkSecondaryColor = Color(0xFF424242);
const Color hintTextDarkColor = Color(0xFF333333);

/// 字体
String get fontFamily => 'HeiTiSlender';

/// 自定义主题颜色
const Color lightBlueColor = Color.fromARGB(255, 242, 245, 254);

class Themes {
  static final light = ThemeData(
    backgroundColor: Colors.white,
    bottomAppBarColor: Colors.white,
    cardColor: navItemUnselectedLightColor,
    primaryColor: primaryClr,
    toggleableActiveColor: Colors.lightBlueAccent,
    unselectedWidgetColor: Colors.black,
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 13,
        color: Colors.lightBlueAccent,
        fontFamily: fontFamily,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 16,
        color: hintTextDarkColor,
        fontFamily: fontFamily,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 13,
        color: hintTextDarkColor,
        fontFamily: fontFamily,
      ),
    ),
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    backgroundColor: darkPrimaryColor,
    bottomAppBarColor: darkPrimaryColor,
    cardColor: navItemUnselectedDarkColor,
    primaryColor: darkGreyClr,
    toggleableActiveColor: Colors.lightBlueAccent,
    unselectedWidgetColor: Colors.white,
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 13,
        color: Colors.white,
        fontFamily: fontFamily,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 16,
        color: hintTextDarkColor,
        fontFamily: fontFamily,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 13,
        color: hintTextDarkColor,
        fontFamily: fontFamily,
      ),
    ),
    brightness: Brightness.dark,
  );
}

/// 选择按钮的颜色
Color get selectorColor => Get.isDarkMode ? darkPrimaryColor : Colors.white;

/// 课程表颜色
Color get courseBackgroundColor =>
    Get.isDarkMode ? Colors.black : Color(0xFFF2F5FA);

/// 白色/黑色背景颜色
Color get whiteBlackBackgroundColor =>
    Get.isDarkMode ? Colors.black : Colors.white;

/// 白色/灰色背景颜色
Color get whiteGreyBackgroundColor =>
    Get.isDarkMode ? darkPrimaryColor : Colors.white;

/// AppBar颜色
Color get appBarColor => Get.isDarkMode ? Colors.black : lightBlueColor;

/// svg icon颜色
Color get svgColor => Get.isDarkMode ? Colors.grey[400]! : Colors.grey[700]!;

/// 列表项颜色
Color get listTileColor => Get.isDarkMode ? Colors.grey[900]! : Colors.white;

/// AppBar上的小部件颜色
Color get appBarWidgetColor => Get.isDarkMode ? Colors.white : Colors.black;

/// 黑白颜色（文字或Icon）
Color get blackWhiteColor => Get.isDarkMode ? Colors.white : Colors.black;

/// 白黑颜色（背景）
Color get whiteBlackColor => Get.isDarkMode ? Colors.black : Colors.white;

/// 白灰颜色（背景）
Color get whiteGreyColor => Get.isDarkMode ? Colors.grey[800]! : Colors.white;

/// 文字颜色
Color get textColor => Get.isDarkMode ? Colors.white : Colors.black;

/// 蓝色icon的颜色
Color get blueIconColor => Get.isDarkMode ? Colors.lightBlue : Colors.blue;

/// 设置项的颜色
Color get settingItemColor => Get.isDarkMode ? Colors.white70 : Colors.black87;

/// 小文字颜色
Color get secondaryTextColor =>
    Get.isDarkMode ? Colors.white70 : Colors.black87;

/// 标题文字
TextStyle get appBarTextStyle => TextStyle(
      color: Get.isDarkMode ? Colors.white : Colors.black,
      fontSize: 20,
      fontFamily: fontFamily,
    );

/// 普通文字样式
TextStyle get plainTextStyle => TextStyle(
      color: Get.isDarkMode ? Colors.white : Colors.black,
      fontFamily: fontFamily,
    );

/// 普通文字字体
TextStyle get ordinaryTextStyle =>
    TextStyle(color: textColor, fontFamily: fontFamily);

/// 任务内容字体
TextStyle get taskItemTextStyle =>
    TextStyle(color: textColor, fontSize: 16, fontFamily: fontFamily);

/// 任务时间字体
TextStyle get taskTimeTextStyle => TextStyle(
      color: Get.isDarkMode ? Colors.lightBlue : Colors.blue,
      fontSize: 12,
    );

/// 提示文字样式样式
TextStyle get hintTextStyle => TextStyle(
      color: Get.isDarkMode ? Colors.grey[400] : Colors.grey[500],
    );

/// 主标题样式
TextStyle get titleTextStyle => GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.white : Colors.black),
    );

/// 副标题样式
TextStyle get subTitleTextStyle => GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 16,
          color: Get.isDarkMode ? Colors.grey[400] : Colors.grey[700]),
    );

TextStyle get subHeadingStyle => GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode ? Colors.grey[400] : Colors.grey));

TextStyle get headingStyle => GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode ? Colors.white : Colors.black));

TextStyle get titleStyle => GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Get.isDarkMode ? Colors.white : Colors.black));

TextStyle get subTitleStyle => GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[600]));
