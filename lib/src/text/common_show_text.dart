import 'package:efficient_infra_ui/src/theme/theme.dart';
import 'package:flutter/material.dart';

class CommonShowText extends StatelessWidget {
  const CommonShowText(
    this.value, {
    Key? key,
  }) : super(key: key);

  final String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13),
      child: Text(
        value ?? '',
        style: TextStyle(
          fontSize: 16,
          color: secondaryTextColor,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}
