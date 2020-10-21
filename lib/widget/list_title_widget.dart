import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum SubTitleAlignment {
  ///title下面
  bottom,
  //跟title一行在右边
  right
}

class ListTitleWidget extends StatelessWidget {
  ///Item左侧的图标
  Widget leading;

  ///Item右侧的图标
  Widget trailing;

  ///自定义的title
  Widget titleWidget;

  ///item下划线
  bool divider;

  //list的高度
  double itemHeight;

  String title;
  int titleColor;
  double titleSize;
  bool titleBold;

  String subtitle;
  int subtitleColor;
  double subtitleSize;

  ///是否显示默认的左侧图片widget
  bool defaultleading;

  ///leading是否居中显示,默认是居中，如果设置为不居中，那么就是坐上显示
  bool leadingCenter;

  //是否圆角
  bool leadingCircle;

  ///如果leadingCenter不居中，那么需要自己设置leading的margin
  EdgeInsets leadingMargin;

  ///是否显示默认的右侧图片widget
  bool defaultTrailing;

  bool showSubtitle;

  ///subtitle的位置,是在
  SubTitleAlignment subtitleAlignment;

  ///左侧Image的图片路径，需要{defalutleading==true}
  String leadingImagePath;

  ///右侧侧Image的图片路径，需要{defaultTrailing==true}
  String trailingImagePath;

  List<double> leadingSize;
  List<double> trailingSize;

  ///标题是否换行
  bool isTitleWrap;

  //点击事件的回调
  final GestureTapCallback onTap;

  ///长按事件的回调
  final GestureLongPressCallback onLongPress;

  int itemBackgroundColor;

  final EdgeInsets dividerMargin;

  ListTitleWidget(
      {Key key,
        this.itemHeight,
        this.leading,
        this.defaultleading = false,
        this.leadingImagePath,
        this.leadingSize = const [16, 16],
        this.leadingCenter = true,
        this.leadingMargin = const EdgeInsets.only(left: 16),
        this.leadingCircle = false,
        this.title,
        this.titleBold= false,
        this.titleColor = 0xff333333,
        this.titleSize = 16,
        this.titleWidget,
        this.subtitle="",
        this.subtitleColor = 0xff333333,
        this.subtitleSize = 13,
        this.subtitleAlignment = SubTitleAlignment.bottom,
        this.trailing,
        this.trailingSize = const [16, 16],
        this.defaultTrailing = false,
        this.trailingImagePath,
        this.isTitleWrap = false,
        this.onTap,
        this.onLongPress,
        this.showSubtitle = true,
        this.dividerMargin,
        this.itemBackgroundColor = 0xffffffff,
        this.divider = true});

  void _leadingWidget() {
    if (leading == null) {
      if (defaultleading) {
        if (this.leadingImagePath != null && this.leadingImagePath.isNotEmpty) {
          if (leadingSize == null) {
            leadingSize = [16, 16];
          }

          double width, height;

          if (leadingSize.length == 1) {
            width = height = leadingSize[0];
          } else {
            width = leadingSize[0];
            height = leadingSize[1];
          }

          if (!leadingCenter) {
            if (leadingMargin == null) {
              leadingMargin =
                  EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0);
            }
          }
          bool imageFromNet = false;
          imageFromNet = leadingImagePath.startsWith("http");
          if(leadingCircle){
            leading = _circleAvatar(leadingImagePath, imageFromNet, width/2);
          }else{
            leading = Container(
              margin: leadingMargin,
              child:
              imageFromNet?Image.network(leadingImagePath ,width: width, height: height):Image.asset(leadingImagePath, width: width, height: height),
            );
          }
        }
      }
    }
  }

  Widget _circleAvatar(String url,bool net,double radius){
    if(net){
      return Container(
        margin: leadingMargin,
        child: CircleAvatar(
          //头像半径
          radius:radius,
          //头像图片
          backgroundImage:NetworkImage(url) ,
        ),
      );
    }else{
      return Container(
        margin: leadingMargin,
        child: CircleAvatar(
          //头像半径
          radius:radius,
          //头像图片
          backgroundImage:AssetImage(url) ,
        ),
      );
    }
  }

  void _trailingWidget() {
    if (trailing == null) {
      if (defaultTrailing) {
        if (this.trailingImagePath != null &&
            this.trailingImagePath.isNotEmpty) {
          if (trailingSize == null) {
            trailingSize = [16, 16];
          }
          double width;
          double height;

          if (trailingSize.length == 1) {
            width = height = trailingSize[0];
          } else {
            width = trailingSize[0];
            height = trailingSize[1];
          }
          trailing = Container(
            margin: EdgeInsets.only(right: 16),
            child: Image.asset(trailingImagePath, width: width, height: height),
          );
        }
      }
    }
  }

  Widget _divider() {
    return Container(
      margin: dividerMargin,
      height: 0.5,
      color: Color(0xffe9e9e9),
    );
  }

  Widget _titleWidget() {
    if (titleWidget != null) {
      return titleWidget;
    }
    if (isTitleWrap) {
      return Text(
        title,
        maxLines: 2,
        style: TextStyle(color: Color(titleColor), fontSize: 16,fontWeight: titleBold?FontWeight.w500:FontWeight.normal),
        softWrap: true,
      );
    } else {
      return Text(title,
          maxLines: 1,
          style: TextStyle(color: Color(titleColor), fontSize: 16,fontWeight: titleBold?FontWeight.w500:FontWeight.normal));
    }
  }

  Widget _buildMainContentWidget() {
    if (subtitleAlignment == SubTitleAlignment.bottom) {
      return Container(
        margin: EdgeInsets.only(top: 18, bottom: 18, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 16), child: _titleWidget()),
            Offstage(
              offstage: !showSubtitle,
              child: Container(
                  margin: EdgeInsets.only(top: 2),
                  child: Text(subtitle,
                      style: TextStyle(
                          color: Color(subtitleColor),
                          fontSize: subtitleSize))),
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(top: 18, bottom: 18, left: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 16), child: _titleWidget()),
            Offstage(
              offstage: !showSubtitle,
              child: Container(
                  margin: EdgeInsets.only(right: trailing == null ? 16 : 8),
                  child: Text(subtitle,
                      style: TextStyle(
                          color: Color(subtitleColor),
                          fontSize: subtitleSize))),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _leadingWidget();
    _trailingWidget();
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        color: Color(itemBackgroundColor),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: leadingCenter
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: <Widget>[
                Offstage(
                  offstage: leading == null,
                  child: leading,
                ),
                Expanded(
                  child: _buildMainContentWidget(),
                ),
                Offstage(
                  offstage: trailing == null,
                  child: trailing,
                ),
              ],
            ),
            Offstage(
              offstage: !divider,
              child: _divider(),
            )
          ],
        ),
      ),
    );
  }
}
