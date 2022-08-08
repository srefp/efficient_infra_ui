import 'package:flutter/material.dart';

import '../../efficient_infra_ui.dart';
import '../theme/theme.dart';
import 'form_submit_button.dart';

class AddItemView extends StatefulWidget {
  const AddItemView({
    Key? key,
    required this.addItems,
    required this.tableName,
    required this.add,
  }) : super(key: key);

  final List<AddItem> addItems;
  final String tableName;
  final VoidCallback add;

  @override
  State<AddItemView> createState() => _AddItemViewState();
}

class _AddItemViewState extends State<AddItemView> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      physics: BouncingScrollPhysics(),
      children: widget.addItems
          .map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: e.controller,
                  style: TextStyle(fontFamily: fontFamily),
                  onEditingComplete: e.onEditingComplete,
                  decoration: InputDecoration(
                    labelText: e.name,
                    hintText: '请输入${e.name}',
                    labelStyle: TextStyle(fontFamily: fontFamily),
                    hintStyle: TextStyle(fontFamily: fontFamily),
                  ),
                ),
              ))
          .toList()
        ..add(
          Padding(
            padding: const EdgeInsets.only(),
            child: FormSubmitButton(
              submit: widget.add,
              text: "添加${widget.tableName}",
            ),
          ),
        ),
    );
  }
}

class AddItem {
  AddItem({
    required this.controller,
    required this.name,
    this.onEditingComplete,
  });

  final TextEditingController controller;
  VoidCallback? onEditingComplete;
  final String name;
}
