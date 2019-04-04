import 'package:flutter/material.dart';
import 'home/home.dart';
import 'follow/follow.dart';
import 'news/news.dart';
import 'me/me.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => new _IndexState();
}

class _IndexState extends State<Index> {
  TextStyle textStyle = TextStyle(
      color: Colors.white70, fontSize: 18.0, fontWeight: FontWeight.w700);
  TextStyle curTextStyle = TextStyle(
      color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w700);
  int curIndex=0;
  List<Widget> Tabs=[
    new Home(),
    new Follow(),
    new News(),
    new Me(),
  ];

  void switchTab(int index){
    setState(() {
      curIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar: new WAppBar(child: new Text("搜也")),
      body: Align(
        alignment: Alignment.center,
        child: Tabs[curIndex],
      ),
      bottomNavigationBar: new BottomAppBar(
        child: Container(
          color: Color(0xFF0E0F1A),
          height: 55.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textBaseline: TextBaseline.ideographic,
            children: <Widget>[
              Expanded(
                child: new Container(
                  alignment: Alignment.center,
                  child:new Container(
                    padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                    decoration: curIndex==0?BoxDecoration(
                        border: Border(bottom: BorderSide(color:Colors.white,width: 2.0))
                    ):BoxDecoration(),
                    child: new Container(
                      child: new InkWell(
                        onTap: (){
                          switchTab(0);
                        },
                        child:  new Text(
                          "首页",
                          style: curIndex==0?curTextStyle:textStyle,
                        ),),
                    ),
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: new Container(
                  alignment: Alignment.center,
                  child:new Container(
                    padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                    decoration:curIndex==1?BoxDecoration(
                        border: Border(bottom: BorderSide(color:Colors.white,width: 2.0))
                    ):BoxDecoration(),
                    child: new Container(
                      child: new InkWell(
                        onTap: (){
                          switchTab(1);
                        },
                        child: new Text(
                          "关注",
                          style: textStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: InkWell(
                      onTap: (){

                      },
                      child: Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    height: 35.0,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).backgroundColor,
                    ),
                  )),
                ),
                flex: 1,
              ),
              Expanded(
                child: new Container(
                  alignment: Alignment.center,
                  child:new Container(
                    padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                    decoration: curIndex==2?BoxDecoration(
                        border: Border(bottom: BorderSide(color:Colors.white,width: 2.0))
                    ):BoxDecoration(),
                    child: new Container(
                      child: new InkWell(
                        onTap: (){
                          switchTab(2);
                        },
                        child: new Text(
                          "消息",
                          style: textStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: new Container(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: (){
                      switchTab(3);
                    },
                    child:new Container(
                      padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                      decoration: curIndex==3?BoxDecoration(
                          border: Border(bottom: BorderSide(color:Colors.white,width: 2.0))
                      ):BoxDecoration(),
                      child: new Container(
                        child:         InkWell(
                          onTap: (){
                            switchTab(3);
                          },
                          child: new Text(
                            "我",
                            style: textStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                flex: 1,
              )
            ],
          ),
        ),
      ),

    );
  }
}
