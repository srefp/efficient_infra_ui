import 'package:flutter/material.dart';

/// 适用于Map<String, List<dynamic>类型的列表展示
class MapListSliverList<E> extends StatelessWidget {
  const MapListSliverList({
    Key? key,
    required this.displayMap,
    required this.displayKeyList,
    required this.keyBuilder,
    required this.itemBuilder,
    this.divider = const Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Divider(),
    ),
  }) : super(key: key);

  /// map
  final Map<E, List<dynamic>> displayMap;

  /// key list
  final List<E> displayKeyList;

  /// key的建造方法
  final Widget Function(E key) keyBuilder;

  /// tile的建造方法
  final Widget Function(List<dynamic> list, int index) itemBuilder;

  /// 分割
  final Widget divider;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: displayKeyList.length,
        (context, index) {
          final key = displayKeyList[index];
          final list = displayMap[key]!;
          return Column(
            children: [
              keyBuilder(key),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return itemBuilder(list, index);
                },
              ),
              if (index != displayKeyList.length - 1) divider,
            ],
          );
        },
      ),
    );
  }
}
