import 'package:efficient_infra_ui/src/theme/theme.dart';
import 'package:flutter/material.dart';

class CommonFormItem extends StatelessWidget {
  final String label;
  final Widget Function(BuildContext context)? contentBuilder;

  final Widget? suffix;
  final String? suffixText;

  final String? hintText;
  final ValueChanged? onChanged;
  final TextEditingController? controller;
  final int? minLines;
  final int? maxLines;
  final VoidCallback? onEditingComplete;

  const CommonFormItem({
    Key? key,
    this.label = '',
    this.contentBuilder,
    this.suffix,
    this.suffixText,
    this.hintText,
    this.onChanged,
    this.controller,
    this.minLines,
    this.maxLines,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: secondaryTextColor,
                fontFamily: fontFamily,
              ),
            ),
          ),
          Expanded(
            child: contentBuilder != null
                ? contentBuilder!(context)
                : TextField(
                    controller: controller,
                    onEditingComplete: onEditingComplete,
                    style:
                        TextStyle(fontFamily: fontFamily, fontSize: 16),
                    minLines: minLines ?? 1,
                    maxLines: maxLines ?? 1,
                    decoration: InputDecoration(
                      hintText: hintText,
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontFamily: fontFamily),
                    ),
                  ),
          ),
          if (suffix != null) suffix!,
          if (suffix == null && suffixText != null) Text(suffixText!)
        ],
      ),
    );
  }
}
