import 'package:efficient_infra_ui/efficient_infra_ui.dart';
import 'package:flutter/material.dart';

/// 自定义的返回
Widget? prepareBackLeading(
  BuildContext context, {
  required VoidCallback onPressed,
}) {
  final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
  final bool canPop = parentRoute?.canPop ?? false;
  Widget? leading = canPop
      ? Tooltip(
          message: '返回',
          textStyle: TextStyle(fontFamily: fontFamily),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.arrow_back,
              color: textColor,
            ),
          ),
        )
      : null;
  return leading;
}
