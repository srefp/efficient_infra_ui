import 'package:efficient_infra_ui/efficient_infra_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TreeDemoController extends GetxController {
  final TreeController treeController =
      TreeController(allNodesExpanded: false);
  final TextEditingController textController = TextEditingController(text: '''
{
  "employee": {
    "name": "sonoo",
    "level": 56,
    "married": true,
    "hobby": null
  },
  "week": [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ]
}
''');

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
