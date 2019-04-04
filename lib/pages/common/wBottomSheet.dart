import 'package:flutter/material.dart';
import './msg/list.dart'; //回复列表
import './msg/msgText.dart'; //回复列表
import 'package:flutter_douyin/store/store.dart';
class WBottomSheet extends StatefulWidget{
  final Widget body;
  WBottomSheet({@required this.body}):super();
  @override
  _WBottomSheetsState createState() => _WBottomSheetsState();
}

class _WBottomSheetsState extends State<WBottomSheet>{
  bool isClose=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WBottomSheel.on((status){
      if(mounted){
        setState(() {
           isClose=status;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      children: <Widget>[
       widget.body,
       isClose?new Positioned(
          child: GestureDetector(
            onTap: (){
              setState(() {
                isClose=false;
              });
            },
            child: new Container(
              height:MediaQuery.of(context).size.height,
              width:MediaQuery.of(context).size.width,
              child: new Stack(
                children: <Widget>[
                  new Positioned(
                    child: new Container(
                      height: MediaQuery.of(context).size.height/2,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: new ListMsg(),
                    ),
                    bottom: 0.0,
                    left: 0.0,
                  )
                ],
              ),
              color: Colors.white.withOpacity(0.1),
            ),
          ),
        ):Container()
      ],
    );
  }
}