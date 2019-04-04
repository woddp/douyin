import 'package:flutter/material.dart';
import '../common/rolling.dart';
import 'dart:async';

class BottomInfo extends StatefulWidget{

  @override
  _BottomInfoState createState() => new _BottomInfoState();
}


class _BottomInfoState extends State<BottomInfo> with SingleTickerProviderStateMixin{
  

  TextStyle textStyleTitle=TextStyle(
    color: Colors.white,
    fontSize: 17.0,
    fontWeight: FontWeight.w700,
  );
  TextStyle textStyleIntrol=TextStyle(
      color: Color(0xFFDCDCDD),
      fontSize: 15.0,
      letterSpacing: .1,
      fontWeight: FontWeight.w500
  );


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new Positioned(
      bottom: 0.0,
      left: 10.0,
      right: 10.0,
      child: new Container(
        width: double.maxFinite,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text("@环球网",style: textStyleTitle,textAlign: TextAlign.left,),
            new Container(height: 10,),
            new Text("记者探访疑似范冰冰美容记者探访疑似范冰冰美容记者探访疑似范冰冰美容记者探访疑似范冰冰美容记者探访疑似范冰冰美容",style: textStyleIntrol,maxLines: 3,softWrap: true,),
            new Container(height: 10,),
            new Row(
              children: <Widget>[
                Expanded(
                  child:Row(
                    children: <Widget>[
                      new Image.asset(
                        'assets/images/dy.png',
                        width: 20.0,
                      ),
                      Expanded(child:  Container(
                        child:new Rolling(
                            child:new Text('@环球网 音乐原声！',style: textStyleIntrol,softWrap: false),
                        ),
                      ),flex: 1,)
                    ],
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: new Container(
                    color: Colors.white,
                  ),
                  flex: 1,
                )
              ],
            ),
            new Container(height: 20,),
          ],
        ),
      ),
    );
  }

}