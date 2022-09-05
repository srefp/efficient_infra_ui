import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../efficient_infra_ui.dart';

extension GetExtensions on GetInterface {
  /// 消息框
  void winSnack(
    String title,
    String message, {
    SnackPosition snackPosition = SnackPosition.TOP,
  }) {
    Get.snackbar(
      '',
      '',
      titleText: WinText(title),
      messageText: WinText(message),
      snackPosition: snackPosition,
    );
  }

  /// 保存对话框
  Future<T?> saveDialog<T>({
    VoidCallback? callback,
    required String title,
    required Widget content,
  }) {
    return Get.defaultDialog<T>(
      title: title,
      titleStyle: TextStyle(fontFamily: fontFamily),
      content: content,
      cancel: TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          '取消',
          style: TextStyle(
            color: Colors.blueAccent,
            fontFamily: fontFamily,
          ),
        ),
      ),
      confirm: TextButton(
        onPressed: () {
          Get.back();
          callback?.call();
        },
        child: Text(
          '确定',
          style: TextStyle(
            color: Colors.red,
            fontFamily: fontFamily,
          ),
        ),
      ),
    );
  }

  /// 对话框
  Future<T?> confirmDialog<T>({
    VoidCallback? callback,
    required String title,
  }) {
    return Get.defaultDialog<T>(
      title: title,
      titleStyle: TextStyle(fontFamily: fontFamily),
      content: Container(),
      cancel: TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          '取消',
          style: TextStyle(
            color: Colors.blueAccent,
            fontFamily: fontFamily,
          ),
        ),
      ),
      confirm: TextButton(
        onPressed: () {
          Get.back();
          callback?.call();
        },
        child: Text(
          '确定',
          style: TextStyle(
            color: Colors.red,
            fontFamily: fontFamily,
          ),
        ),
      ),
    );
  }
}
