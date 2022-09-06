import 'package:flutter/material.dart';

import '../../efficient_infra_ui.dart';

class InputPanel extends StatelessWidget {
  const InputPanel({
    Key? key,
    required this.name,
    this.start,
    this.actionList = const <Widget>[],
    required this.editingController,
    this.callback,
    this.fontFamily = 'Consolas',
  }) : super(key: key);

  final String name;
  final Widget? start;
  final List<Widget> actionList;
  final TextEditingController editingController;
  final ValueChanged<String>? callback;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final height = constraints.biggest.height - 54;
      return Card(
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 36,
              color: whiteBlackBackgroundColor,
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      WinText(name),
                      SizedBox(
                        width: 10,
                      ),
                      start ?? Container(),
                    ],
                  ),
                  Row(
                    children: actionList,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: height,
                  minHeight: height,
                ),
                child: TextField(
                  style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 16,
                  ),
                  controller: editingController,
                  onChanged: debounce((String value) {
                    callback?.call(value);
                  }),
                  decoration: null,
                  autofocus: true,
                  maxLines: null,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class ElasticTextField extends StatelessWidget {
  const ElasticTextField({
    Key? key,
    required this.editingController,
    this.callback,
    this.fontFamily,
    this.decoration,
    this.editCallback,
  }) : super(key: key);

  final TextEditingController editingController;
  final ValueChanged<String>? callback;
  final String? fontFamily;
  final InputDecoration? decoration;
  final VoidCallback? editCallback;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final height = constraints.biggest.height;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: height,
            minHeight: height,
          ),
          child: TextField(
            style: TextStyle(
              fontFamily: fontFamily,
              fontSize: 16,
            ),
            controller: editingController,
            onChanged: (String value) {
              editCallback?.call();
              callback?.call(value);
            },
            decoration: decoration,
            autofocus: true,
            maxLines: null,
          ),
        ),
      );
    });
  }
}
