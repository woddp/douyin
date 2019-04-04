import 'package:flutter/material.dart';
import 'package:flutter_douyin/common/plugin.dart';
class Head extends StatefulWidget{

  @override
  _HeadState createState()=>new _HeadState();
}

class _HeadState extends  State<Head>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Container(
      
      height:MediaQuery.of(context).padding.top+50.0 ,
      child:  new Column(
        children: <Widget>[
          Container(
            height:MediaQuery.of(context).padding.top ,
          ),
          Container(
            decoration: new BoxDecoration(
                color: Theme.of(context).backgroundColor.withOpacity(0.000)
            ),
//            color: Colors.black.withOpacity(0.1),
            height:  50.0,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            child: new Container(
                              alignment: Alignment.center,
                              child: new Text("推荐",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600,color: Colors.white),),
                            ),
                          flex: 1,
                        ),
                        Expanded(
                          child: new Container(
                            alignment: Alignment.center,
                            child: new Text("|",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w100,color: Colors.grey),),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                            child: new Container(
                              alignment: Alignment.center,
                              child: new Text("最新",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600,color:Colors.white70),),
                            ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(right: 20.0),
                    child: InkWell(
                      child: Icon(Icons.search),
                    ),
                  ),
                  flex: 1,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}