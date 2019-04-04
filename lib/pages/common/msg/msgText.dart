import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:flutter_douyin/store/store.dart';
import 'dart:ui';
import 'emoji.dart';
class MsgText extends StatefulWidget{

  MsgText():super();
  _MsgTextState createState(){
    return new _MsgTextState();
  }
}
class _MsgTextState extends State<MsgText>{
final TextEditingController _textEditingController=new TextEditingController();
FocusNode _focusNode=new FocusNode();

KeyboardVisibilityNotification _keyboardVisibilityNotification;

bool isKeyboard=false;//判断键盘是否打开

bool isOpenEmoji=false;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController.addListener((){
        double height=MediaQuery.of(context).viewInsets.bottom;

    });
    _focusNode.addListener((){

    });
    _keyboardVisibilityNotification=new KeyboardVisibilityNotification();
    ///监听键盘的状态 是开启还是关闭
    _keyboardVisibilityNotification.addNewListener(
      onChange: (bool visible) {
        if(mounted){
          setState(() {
            isKeyboard=visible;
          });
        }
         if(!visible){
           _focusNode.unfocus();//
         }
      },
    );
    //通过点击列表开启键盘
    Keyboardfocus.on((status){
      if(mounted){
        setState(() {
          if(status){
            FocusScope.of(context).requestFocus(_focusNode);  //开启键盘
          }
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [ //阴影
          BoxShadow(
              color:Colors.black54,
              offset: Offset(2.0,2.0),
              blurRadius: 4.0
          )
        ],
        border:Border(top: BorderSide(color:Colors.grey.withOpacity(0.5),width:1.3)),
      ),
      child:  new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: new TextField(
                  controller: _textEditingController,
                  focusNode: _focusNode,
                  maxLines: 2,
                  cursorWidth: 2.0,
                  onTap:(){
                    setState(() {
                      isOpenEmoji=false;
                    });
                  },
                  onChanged:(val){
                  },
                  cursorRadius: Radius.circular(5.0),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 00.0),
                    hintText: "留下你的精彩评论吧",
                    hintStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w200),
                    border: InputBorder.none,
                  ),
                ),
                flex: 1,
              ),
              new Container(
                width: 80.0,
                color: Colors.yellow,
                child:  new Row(
                  children: <Widget>[
                    Expanded(
                      child: new InkWell(
                        onTap: (){
                          setState(() {
                            isOpenEmoji=!isOpenEmoji;
                          });
                          _focusNode.unfocus();
                        },
                        child: new Icon(Icons.mood,color: Color(0xFF8B8C91),),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: new InkWell(
                        child: new Icon(Icons.send,color: Color(0xFFFE2C55)),
                      ),
                      flex: 1,
                    )
                  ],
                ),
              ),
            ],
          ),
          isOpenEmoji?new Emoji():Container(),
        ],
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
    _focusNode.dispose();

  }
}