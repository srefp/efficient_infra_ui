import 'package:efficient_infra_ui/src/theme/theme.dart';
import 'package:flutter/material.dart';

/// 高亮Text
class HighlightText extends StatelessWidget {
  /// 要显示的内容
  final String text;

  /// 要显示的内容中，需要高亮显示的文字(默认为空字符串，即不高亮显示文本)
  final String lightText;

  /// 要显示的内容的文本风格
  final TextStyle? textStyle;

  /// 要显示的内容中，需要高亮显示的文字的文本风格
  final TextStyle? lightStyle;

  /// 默认普通文本的样式
  final TextStyle _defaultTextStyle = TextStyle(
    fontSize: 16,
    color: textColor,
    fontFamily: fontFamily,
  );

  /// 默认高亮文本的样式
  final TextStyle _defaultLightStyle = TextStyle(
    fontSize: 16,
    color: Colors.orangeAccent,
    fontFamily: fontFamily,
  );

  HighlightText({
    Key? key,
    required this.text,
    this.lightText = "",
    this.textStyle,
    this.lightStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 如果没有需要高亮显示的内容
    if (lightText.isEmpty) {
      return Text(text, style: textStyle ?? _defaultTextStyle);
    }
    // 如果有需要高亮显示的内容
    return _lightView();
  }

  /// 需要高亮显示的内容
  Widget _lightView() {
    List<TextSpan> spans = [];
    // 当前要截取字符串的起始位置
    int start = 0;
    // end 表示要高亮显示的文本出现在当前字符串中的索引
    int end;

    // 都转换成小写再进行比较
    final textLower = text.toLowerCase();
    final lightTextLower = lightText.toLowerCase();

    // 如果有符合的高亮文字
    end = textLower.indexOf(lightTextLower, start);
    while ((end = textLower.indexOf(lightTextLower, start)) != -1) {
      // 获取符合的高亮文字再text中对应的原始文字
      final originalTextPart = text.substring(end, end + lightText.length);
      // 第一步：添加正常显示的文本
      spans.add(TextSpan(
          text: text.substring(start, end),
          style: textStyle ?? _defaultTextStyle));
      // 第二步：添加高亮显示的文本
      spans.add(
          TextSpan(text: originalTextPart, style: lightStyle ?? _defaultLightStyle));
      // 设置下一段要截取的开始位置
      start = end + lightText.length;
    }
    // 如果没有要高亮显示的，则start=0，也就是返回了传进来的text
    // 如果有要高亮显示的，则start=最后一个高亮显示文本的索引，然后截取到text的末尾
    spans.add(
      TextSpan(
          text: text.substring(start, text.length),
          style: textStyle ?? _defaultTextStyle),
    );

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}
