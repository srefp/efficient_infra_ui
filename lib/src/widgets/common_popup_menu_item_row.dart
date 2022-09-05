import 'package:efficient_infra_ui/efficient_infra_ui.dart';
import 'package:flutter/material.dart';

class CommonPopupMenuItemRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const CommonPopupMenuItemRow({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: settingItemColor,
        ),
        SizedBox(width: 20),
        Text(
          text,
          style: TextStyle(
            color: settingItemColor,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
