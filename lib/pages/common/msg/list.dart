import 'package:flutter/material.dart';
import 'suList.dart';
import 'msgText.dart';
import 'package:flutter_douyin/store/store.dart';
class ListMsg extends StatefulWidget {
  _ListMsgState createState() {
    return new _ListMsgState();
  }
}

//列表
class ItemReply extends StatelessWidget {
  final String portrait; //头像
  final String name; //名称
  final String text; //内容
  final String time; //时间
  final String isFabulous;//是否点赞
  final String fabulousCount;//点赞数
  ItemReply(
      {@required this.portrait,
      @required this.name,
      @required this.time,
      @required this.text,
      @required this.isFabulous,
      @required this.fabulousCount})
      : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: (){
        Keyboardfocus.emit(true);
        return false;
      },
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(bottom: 15.0),
        child:  Row(
          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            new Container(
              width: 35.0,
              height:35.0,
              child:  CircleAvatar(
                backgroundImage:new NetworkImage(this.portrait) ,
              ),
            ),
            new Expanded(
              flex: 1,
              child:new Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child:  new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(this.name,style: TextStyle(color: Color(0xFF909197),fontSize: 13.0,fontWeight: FontWeight.w500),),
                    new Container(height: 5.0,),
                    new Text.rich(
                        TextSpan(
                            children: [
                              new TextSpan(
                                  text: this.text,
                                  style: TextStyle(fontSize: 14.0)
                              ),
                              new TextSpan(
                                  text: this.time,
                                  style: TextStyle(color: Color(0xFFB9B9BD),fontSize: 14.0)
                              )

                            ]
                        )
                    )
                  ],
                ),
              ),
            ),
            new Column(
              children: <Widget>[
                new InkWell(
                  child: new Icon(Icons.favorite,color: Color(0xFFDCDDDE),size: 20,),
                  onTap: (){
                    print(1);
                  },
                ),
                new Text(this.fabulousCount,style: TextStyle(color: Color(0xFF939499),fontSize: 13.0),),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//回复列表
class ItemReplySmall extends StatelessWidget {
  final String portrait; //头像
  final String name; //名称
  final String text; //内容
  final String time; //时间
  final String isFabulous;//是否点赞
  final String fabulousCount;//点赞数
  ItemReplySmall(
      {@required this.portrait,
        @required this.name,
        @required this.time,
        @required this.text,
        @required this.isFabulous,
        @required this.fabulousCount})
      : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: (){
        return false;
      },
      child: Container(
        margin: EdgeInsets.only(left: 50.0),
        padding: EdgeInsets.all(10.0),
        child:  Row(
          children: <Widget>[
            new Container(
              width: 30.0,
              height:30.0,
              child:  CircleAvatar(
                backgroundImage:new NetworkImage(this.portrait) ,
              ),
            ),
            new Expanded(
              flex: 1,
              child:new Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child:  new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(this.name,style: TextStyle(color: Color(0xFF909197),fontSize: 16.0,fontWeight: FontWeight.w500),),
                    new Text.rich(
                        TextSpan(
                            children: [
                              new TextSpan(
                                  text: this.text,
                                  style: TextStyle(fontSize: 16.0)
                              ),
                              new TextSpan(
                                  text: this.time,
                                  style: TextStyle(color: Color(0xFFB9B9BD),fontSize: 16.0)
                              )

                            ]
                        )
                    )
                  ],
                ),
              ),
            ),
            new Column(
              children: <Widget>[
                new InkWell(
                  child: new Icon(Icons.favorite,color: Color(0xFFDCDDDE),),
                  onTap: (){
                    print(1);
                  },
                ),
                new Text(this.fabulousCount,style: TextStyle(color: Color(0xFF939499),fontSize: 12.0),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
class _ListMsgState extends State<ListMsg> {
  double keyBordHeight=0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      children: <Widget>[
        new Positioned(
          top: 0.0,
          height:35.0,
          width: MediaQuery.of(context).size.width,
          child: new GestureDetector(
            onTap: (){
              return false;
            },
            child: new Container(
              alignment: Alignment.center,
              child: new Text(
                "175条评论",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
            ),
          ),
        ),
        new Positioned(
          right: 10.0,
          top: 0.0,
          width: 30.0,
          height: 35.0,
          child: new InkWell(
            onTap: () {
//              Navigator.of(context).pop();
                WBottomSheel.emit(false); //关闭评论框
            },
            child: new Icon(
              Icons.clear,
              color: Colors.black,
              size: 17.0,
            ),
          ),
        ),

        //列表
        new GestureDetector(
          onTap: (){
            return false;
          },
          child: Container(
            margin: EdgeInsets.only(top: 35.0,bottom: 70.0),
            child: new ListView.builder(
                itemCount: 100,
                itemBuilder: (context, item) {
                  return new Column(
                    children: <Widget>[
                      new ItemReply(
                        portrait: "https://cdn2.jianshu.io/assets/default_avatar/6-fd30f34c8641f6f32f5494df5d6b8f3c.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96",
                        name: "@喜欢和风大的不死",
                        text: "最后的武士！？？？选用五十到劲射,Flutter 开发的抖选用五十到劲射选用五十到劲射选用五十到劲射选用五十到劲射选用五十到劲射选用五十到劲射音 app ",
                        time: "3小时前",
                        isFabulous: "0",
                        fabulousCount: "200",

                      ),
                      item==1? new Sulist():new Container(),
                    ],
                  );
                }),
          ),
        ),
        //评论框
        new Positioned(
          bottom: keyBordHeight,
          width: MediaQuery.of(context).size.width,
          child: new GestureDetector(
            onTap: (){
              return false;
            },
            child:new MsgText(),
          ),
        ),
      ],
    );
  }
}
