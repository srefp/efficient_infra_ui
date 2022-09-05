import 'package:flutter/material.dart';

import '../../efficient_infra_ui.dart';

class WinCommonNavigationBar extends StatefulWidget {
  const WinCommonNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.width = 100,
    this.height = 50,
    this.isColumn = true,
  }) : super(key: key);

  final int currentIndex;
  final double width;
  final double height;
  final ValueChanged<int>? onTap;
  final List<NavItem> items;
  final bool isColumn;

  @override
  State<WinCommonNavigationBar> createState() => _WinCommonNavigationBarState();
}

class _WinCommonNavigationBarState extends State<WinCommonNavigationBar> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isColumn) {
      return SizedBox(
        width: widget.width,
        child: Material(
          color: Theme.of(context).cardColor,
          child: ListView(
            controller: _scrollController,
            children: [
              Column(
                children: _createTiles(),
              ),
            ],
          ),
        ),
      );
    } else {
      return SizedBox(
        height: widget.height,
        child: Row(
          children: [
            Row(
              children: _createTiles(),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).cardColor,
              ),
            ),
          ],
        ),
      );
    }
  }

  List<Widget> _createTiles() {
    final List<Widget> tiles = [];
    for (int i = 0; i < widget.items.length; i++) {
      tiles.add(
        _NavTile(
          isColumn: widget.isColumn,
          selected: i == widget.currentIndex,
          item: widget.items[i],
          onTap: () {
            widget.onTap?.call(i);
          },
        ),
      );
    }
    return tiles;
  }
}

class _NavTile extends StatelessWidget {
  const _NavTile({
    Key? key,
    this.isColumn = true,
    required this.selected,
    required this.item,
    this.onTap,
  }) : super(key: key);

  final bool isColumn;
  final bool selected;
  final NavItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    double? width;
    if (isColumn) {
      width = MediaQuery.of(context).size.width;
    } else {
      width = 100;
    }
    return Ink(
      color: selected ? navItemSelectedColor : navItemUnselectedColor,
      child: InkWell(
        canRequestFocus: false, // 禁止聚集
        onTap: onTap,
        child: SizedBox(
          width: width,
          height: 50,
          child: Center(
            child: Text(
              item.label,
              style: TextStyle(fontFamily: fontFamily),
            ),
          ),
        ),
      ),
    );
  }
}

class NavItem {
  NavItem({required this.label});

  final String label;
}
