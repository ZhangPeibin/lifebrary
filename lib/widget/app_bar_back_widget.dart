import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarBackWidget extends StatelessWidget{

  VoidCallback backCall;
  String backImagePath;

  AppBarBackWidget({this.backCall,this.backImagePath});

  @override
  Widget build(BuildContext context) {
    if(this.backImagePath==null){
      this.backImagePath = "white_back.png";
    }
    return GestureDetector(
      onTap: (){
        if(this.backCall!=null){
          this.backCall();
        }else{
          Navigator.of(context).pop();
        }
      },
      child: Container(
        width: 90,
        height: 50,
        child: IconButton(
          icon: Image.asset(backImagePath, width: 12, height: 19),
        ),
      ),
    );
  }

}