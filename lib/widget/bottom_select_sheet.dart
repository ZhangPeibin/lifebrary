import 'dart:ui';

import 'package:flutter/material.dart';

/// 底部弹出框
class BottomSelectSheet extends StatefulWidget {
  BottomSelectSheet({Key key, this.list, this.onItemClickListener})
      : assert(list != null),
        super(key: key);
  final list;
  final OnItemClickListener onItemClickListener;

  @override
  _BottomSelectSheetState createState() => _BottomSelectSheetState();
}

typedef OnItemClickListener = void Function(int index);

class _BottomSelectSheetState extends State<BottomSelectSheet> {
  var itemCount;
  var height;
  double itemHeight = 50;
  double circular = 10;
  static const double cancelWidgetHeight = 55;

  //删除按钮
  var cancelContainer;

  OnItemClickListener onItemClickListener;

  @override
  void initState() {
    super.initState();
    onItemClickListener = widget.onItemClickListener;
    itemCount = (widget.list.length * 2 - 1) + 1;
    height = (widget.list.length) * itemHeight +
        (widget.list.length - 1) * 0.5 +
        cancelWidgetHeight;

    cancelContainer = cancel();
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size screenSize = MediaQuery.of(context).size;
    var deviceWidth = orientation == Orientation.portrait
        ? screenSize.width
        : screenSize.height;

    var listView = ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          if (index == itemCount - 1) {
            return new Container(
              child: cancelContainer,
            );
          }
          return getItem(context, index);
        });

    var borderRadius;
    if (widget.list.length > 1) {
      borderRadius = BorderRadius.only(
          topLeft: Radius.circular(circular),
          topRight: Radius.circular(circular));
    }

    var totalContainer = Container(
      child: listView,
      height: height,
      width: deviceWidth,
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: borderRadius),
    );

    var stack = Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          bottom: 0,
          child: totalContainer,
        ),
      ],
    );
    return stack;
  }

  Widget getItem(BuildContext context, int index) {
    if (widget.list == null) {
      return Container();
    }
    if (index.isOdd) {
      return Container(
        height: 0.5,
        color: Color(0xffe9e9e9),
      );
    }
    int listIndex = index ~/ 2;
    var text = widget.list[listIndex];
    var itemContainer = Container(
        height: itemHeight,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
              color: Color(0xFF333333),
              fontSize: 17),
        ));

    var onTap2 = () {
      if (onItemClickListener != null) {
        onItemClickListener(index);
      }
    };
    return GestureDetector(
      onTap: onTap2,
      child: itemContainer,
    );
  }

  Widget cancel() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
          height: cancelWidgetHeight,
          decoration: BoxDecoration(
            color: Colors.white, // 底色
          ),
          child: Center(
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 5,
                    color: Color(0xffF6F7FB),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          "取消",
                          style: TextStyle(
                              fontFamily: 'Robot',
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                              color: Color(0xFF333333),
                              fontSize: 17),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
