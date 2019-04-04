import 'package:flutter/material.dart';
import '../common/wAppBar.dart';
class Follow extends StatefulWidget{
  @override
  _FollowState createState()=>new _FollowState();
}

class _FollowState extends State<Follow>{
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: WAppBar(
        child: new Row(
          children: <Widget>[
            Expanded(child: new Container(
              child: new Text('1'),
            ))
          ],
        ),
      ),
      body: new Container(
        child: new Text('1'),
      ),
    );
  }
}