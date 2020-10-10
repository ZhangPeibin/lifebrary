import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifebray/widget/app_bar_back_widget.dart';
import 'package:lifebray/widget/list_title_widget.dart';

class TransferBankListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransferBankListPageState();
  }
}

class _TransferBankListPageState extends State<TransferBankListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "转账到银行卡",
            style: TextStyle(fontSize: 18, color: Color(0xD9000000)),
          ),
          brightness: Brightness.dark,
          leading: AppBarBackWidget(),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          color: Color(0xffF6F7FB),
          child: Column(
            children: <Widget>[
              ListTitleWidget(
                title: "张培斌",
                subtitle: "自定义title",
                defaultleading: true,
                titleWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                        text: TextSpan(
                            text: "222",
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff3edf3f)),
                            children: [
                          TextSpan(
                              text: "name",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff5d453f),
                              )),
                        ])),
                    Text("222")
                  ],
                ),
                leadingImagePath: "images/ico_zdyhk_yhk.png",
                leadingSize: [32, 32],
                defaultTrailing: true,
                isTitleWrap: true,
                showSubtitle: true,
              ),
              ListTitleWidget(
                title: "张培斌1",
                subtitle: "无leading",
                leadingImagePath: "images/ico_zdyhk_yhk.png",
                leadingSize: [32, 32],
                isTitleWrap: true,
                showSubtitle: true,
                trailingImagePath: "images/ico_goto.png",
              ),
              ListTitleWidget(
                title: "张培斌1",
                subtitle: "有leading widget",
                leadingImagePath: "images/ico_zdyhk_yhk.png",
                leadingSize: [32, 32],
                isTitleWrap: true,
                showSubtitle: true,
                defaultleading: true,
                trailingImagePath: "images/ico_goto.png",
              ),
              ListTitleWidget(
                title: "张培斌",
                subtitle: "网络图leading非circle",
                defaultleading: true,
                leadingImagePath: "https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg",
                leadingSize: [32, 32],
                defaultTrailing: true,
                isTitleWrap: true,
                showSubtitle: true,
                subtitleAlignment: SubTitleAlignment.right,
                subtitleColor: 0xFFF35856,
                trailingImagePath: "images/ico_goto.png",
              ),
              ListTitleWidget(
                title: "张培斌",
                subtitle: "网络图leading,circle显示",
                defaultleading: true,
                leadingImagePath: "https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg",
                leadingCircle: true,
                leadingSize: [32, 32],
                defaultTrailing: true,
                showSubtitle: true,
                subtitleAlignment: SubTitleAlignment.right,
                subtitleColor: 0xFFF35856,
                trailingImagePath: "images/ico_goto.png",
              ),
              ListTitleWidget(
                title: "张培斌",
                subtitle: "asset图片，圆角显示",
                defaultleading: true,
                leadingImagePath: "images/ico_zdyhk_yhk.png",
                leadingSize: [32, 32],
                isTitleWrap: true,
                showSubtitle: true,
                subtitleAlignment: SubTitleAlignment.right,
                subtitleColor: 0xFFF35856,
                leadingCircle: true,
              ),
            ],
          ),
        ));
  }
}
