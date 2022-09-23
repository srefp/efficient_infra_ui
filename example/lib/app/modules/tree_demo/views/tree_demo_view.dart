import 'dart:convert';

import 'package:efficient_infra_ui/efficient_infra_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tree_demo_controller.dart';

class TreeDemoView extends GetView<TreeDemoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('树形控件'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 600,
                width: 400,
                child: TextField(
                  maxLines: 10000,
                  controller: controller.textController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  style: TextStyle(fontFamily: "courier"),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_right),
                iconSize: 40,
                onPressed: controller.update,
              ),
              Container(
                child: buildTree(),
                width: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 根据输入的内容构建树
  Widget buildTree() {
    try {
      var parsedJson = json.decode(controller.textController.text);
      return TreeView(
        nodes: toTreeNodes(parsedJson),
        treeController: controller.treeController,
      );
    } on FormatException catch (e) {
      return Text(e.message);
    }
  }

  List<TreeNode> toTreeNodes(dynamic parsedJson) {
    if (parsedJson is Map<String, dynamic>) {
      return parsedJson.keys
          .map((k) => TreeNode(
              content: Text('$k:'), children: toTreeNodes(parsedJson[k])))
          .toList();
    }
    if (parsedJson is List<dynamic>) {
      return parsedJson
          .asMap()
          .map((i, element) => MapEntry(i,
              TreeNode(content: Text('[$i]:'), children: toTreeNodes(element))))
          .values
          .toList();
    }
    return [TreeNode(content: Text(parsedJson.toString()))];
  }
}
