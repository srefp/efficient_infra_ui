import 'package:efficient_infra_ui/src/course_table/course.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const titleColor = Color(0xFFFDFDFD);

class CourseTable extends StatefulWidget {
  const CourseTable({
    Key? key,
    required this.dateList,
    required this.month,
    required this.week,
    required this.mondayDate,
    required this.currentWeek,
    required this.courses,
    required this.addRoute,
    this.halfSectionNum = 6,
    this.titleWidth = 20,
    this.titleHeight = 50,
    this.gridHeight = 60,
    this.titleDecoration = const BoxDecoration(
      color: titleColor,
    ),
    this.outerGridDecoration = const BoxDecoration(
      color: Colors.white,
    ),
    this.innerGridDecoration = const BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.all(
        const Radius.circular(8.0),
      ),
      boxShadow: <BoxShadow>[
        const BoxShadow(
          color: Colors.grey,
          offset: Offset(1.0, 1.0),
          blurRadius: 4.0,
        ),
      ],
    ),
  }) : super(key: key);

  final List<String> dateList;

  /// 周数
  final int week;

  /// 当前周数
  final int currentWeek;

  /// 当前的周一日期
  final DateTime mondayDate;

  /// 节数的一半
  final int halfSectionNum;

  /// 表头宽度
  final double titleWidth;

  /// 表头高度
  final double titleHeight;

  /// 格子高度
  final double gridHeight;

  /// 月份
  final String month;

  /// 添加页面的路由
  final String addRoute;

  final List<Course> courses;

  final BoxDecoration titleDecoration;
  final BoxDecoration outerGridDecoration;
  final BoxDecoration innerGridDecoration;

  @override
  State<CourseTable> createState() => _CourseTableState();
}

class _CourseTableState extends State<CourseTable> {
  int? tappedRow;

  int? tappedColumn;

  Widget _renderGrid(BuildContext context, int row, int column) {
    Course? course = widget.courses.getByRowAndCol(row: row, column: column);

    final innerWidget = course == null
        ? _EmptyTile(
            route: widget.addRoute,
            row: row,
            column: column,
            tappedRow: tappedRow,
            tappedColumn: tappedColumn,
            callback: (int row, int column) {
              setState(() {
                tappedRow = row;
                tappedColumn = column;
              });
            })
        : Container(
            child: Text(
              course.name + "@" + course.room,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
            ),
            decoration: widget.innerGridDecoration,
            margin: EdgeInsets.all(3.0),
            padding: EdgeInsets.all(2.0),
          );

    return Container(
      child: innerWidget,
      height: widget.gridHeight * (course?.sectionNum ?? 2),
      decoration: widget.outerGridDecoration,
    );
  }

  Widget _renderSide(BuildContext context) {
    final list = <Widget>[];
    for (var i = 1; i <= widget.halfSectionNum; i++) {
      list.add(Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              (i * 2 - 1).toString(),
              style: TextStyle(color: Colors.black),
            ),
            Text(
              (i * 2).toString(),
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        decoration: widget.titleDecoration,
        width: widget.titleWidth,
        height: widget.gridHeight * 2,
      ));
    }
    return Column(
      children: list,
    );
  }

  Widget _renderColumn(BuildContext context, int column) {
    final list = <Widget>[];

    for (int row = 1; row <= widget.halfSectionNum * 2;) {
      Course? course = widget.courses.getByRowAndCol(row: row, column: column);
      int flex = course?.sectionNum ?? 1;
      list.add(Expanded(
        flex: flex,
        child: _renderGrid(
          context,
          row,
          column,
        ),
      ));
      row += flex;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    final columns = <Widget>[];
    columns.add(_renderSide(context));
    for (int column = 1; column <= 7; column++) {
      columns.add(Expanded(child: _renderColumn(context, column)));
    }

    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: titleColor,
            toolbarHeight: widget.titleHeight,
            pinned: true,
            flexibleSpace: _renderHeader(),
            elevation: 0,
          ),
        ];
      },
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Colors.white,
                  height: widget.gridHeight * widget.halfSectionNum * 2,
                  child: Row(
                    children: columns,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderHeader() {
    final list = <Widget>[];
    final weekNames = const ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
    list.add(
      Container(
        child: Center(
          child: Text(
            '${widget.month}\n月',
            textAlign: TextAlign.center,
          ),
        ),
        height: widget.titleHeight,
        decoration: widget.titleDecoration,
        width: widget.titleWidth,
      ),
    );
    for (var i = 0; i < weekNames.length; i++) {
      list.add(
        Expanded(
          child: Container(
            alignment: Alignment.center,
            decoration: widget.titleDecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weekNames[i],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                Text(
                  widget.dateList[i],
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            height: widget.titleHeight,
          ),
        ),
      );
    }
    return Row(
      children: list,
    );
  }
}

class _EmptyTile extends StatefulWidget {
  const _EmptyTile({
    Key? key,
    required this.route,
    required this.row,
    required this.column,
    required this.tappedRow,
    required this.tappedColumn,
    required this.callback,
  }) : super(key: key);

  final String route;
  final int row;
  final int column;
  final int? tappedRow;
  final int? tappedColumn;
  final void Function(int, int) callback;

  @override
  State<_EmptyTile> createState() => _EmptyTileState();
}

class _EmptyTileState extends State<_EmptyTile> {
  @override
  Widget build(BuildContext context) {
    bool _isTapped = widget.tappedRow != null &&
        widget.tappedColumn != null &&
        widget.tappedRow == widget.row &&
        widget.tappedColumn == widget.column;
    return GestureDetector(
      onTap: () {
        widget.callback.call(widget.row, widget.column);
        setState(() {
          if (_isTapped) {
            Get.toNamed(
              widget.route,
              arguments: {'dayOfWeek': widget.row, 'section': widget.column},
            );
          }
        });
      },
      child: _isTapped
          ? Container(
              color: Colors.grey,
              width: double.infinity,
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            )
          : Container(
              color: Colors.white,
              width: double.infinity,
            ),
    );
  }
}
