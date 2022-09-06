import 'package:flutter/material.dart';

/// 主题变换
class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({
    Key? key,
    required this.isDarkMode,
    required this.onTap,
  }) : super(key: key);

  final bool isDarkMode;
  final VoidCallback onTap;

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isDarkMode = !_isDarkMode;
        });
        widget.onTap.call();
      },
      child: Icon(
        _isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
        size: 20,
        color: _isDarkMode ? Colors.white : Colors.black,
      ),
    );
  }
}
