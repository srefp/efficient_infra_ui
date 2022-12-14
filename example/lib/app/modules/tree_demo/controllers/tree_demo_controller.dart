import 'package:efficient_infra_ui/efficient_infra_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TreeDemoController extends GetxController {
  final TreeController treeController = TreeController(allNodesExpanded: false);
  final currentKey = Rxn<Key>();
  final TextEditingController textController = TextEditingController(text: '''
[
  {
    "id": 1,
    "name": "公司领导",
    "children": [
      {
        "id": 2,
        "parentId": 1,
        "name": "刘某某",
        "isOnline": true
      },
      {
        "id": 3,
        "name": "何某",
        "isOnline": true
      }
    ]
  },
  {
    "id": 4,
    "name": "公司领导",
    "children": [
      {
        "id": 5,
        "name": "作业部门",
        "children": [
          {
            "id": 6,
            "name": "刘某某",
            "isOnline": true
          },
          {
            "id": 7,
            "name": "何某",
            "isOnline": true
          }
        ]
      }
    ]
  }
]
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

  void onTap(Key value) {
    currentKey.value = value;
  }
}
