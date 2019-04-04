import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
class StartBtn extends StatefulWidget {
  final GestureTapCallback onClick;

  StartBtn({this.onClick});

  @override
  _StartBtnState createState() {
    return new _StartBtnState();
  }
}

class _StartBtnState extends State<StartBtn>
    with SingleTickerProviderStateMixin {

  AnimationController _animatedContainer;
  Animation<double> _animated_wdith;
  Animation<double> _animated_two_width;
  Animation<double> _animated_wdith_border;

  bool is_two_circu = true; //里面是否是圆


  bool isStart = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iniStart();
  }

  void iniStart() {
    _animatedContainer = new AnimationController(
        duration: const Duration(milliseconds: 800),
        vsync: this);

    _animated_wdith =
        new Tween(begin: 80.0, end: 70.0).animate(_animatedContainer);
    _animated_wdith_border =
        new Tween(begin: 10.0, end: 6.0).animate(_animatedContainer);

    _animated_two_width =
        new Tween(begin: 50.0, end: 30.0).animate(_animatedContainer);

    _animated_wdith_border.addListener(() {
      setState(() {

      });
    });
    _animatedContainer.addStatusListener((status){
       if(isStart==true){
         if (status == AnimationStatus.completed) {
           setState(() {
             is_two_circu=false;
           });
           _animatedContainer.reverse();
         } else if (status == AnimationStatus.dismissed) {
           _animatedContainer.forward();
         }
       }else{
         setState(() {
           is_two_circu=true;

         });
         _animatedContainer.reset();
       }
    });
  }
    Future<void> _playAnimation() async {
      try {
        _animatedContainer
            .forward()
            .orCancel;
        _animatedContainer
            .reverse()
            .orCancel;
      } on TickerCanceled {

      }
    }


    bool isDown=false;

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Align(
        child: new InkWell(
          onTap: () {
            setState(() {
              isStart=!isStart;
              if(isStart==true){
                _animatedContainer.forward();
              }
            });

          },
          child:new Container(
            height: 100.0,
            child: new Align(
              child: new Container(
                height:  _animated_wdith.value ,
                width:  _animated_wdith.value ,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Color.fromRGBO(229, 113, 138, 0.5),
                    width:  _animated_wdith_border.value,
                  ),

                ),
                child: Align(
                  child: new Container(
                    height: is_two_circu?_animated_two_width.value:30.0,
                    width: is_two_circu?_animated_two_width.value:30.0,
                    child: new Text(isStart.toString()),
                    decoration: BoxDecoration(
                        color: Color(0xFFFE2C55),
                        borderRadius: BorderRadius.all(
                            Radius.circular(is_two_circu ? 100 : 5))
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
}

class Animated extends AnimatedWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}