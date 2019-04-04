import 'package:flutter/material.dart';
import 'package:flutter_douyin/store/store.dart';
class Sulist extends StatefulWidget {
  _SulistState createState() {
    return new _SulistState();
  }
}

//回复列表
class ItemReplySmall extends StatelessWidget {
  final String portrait; //头像
  final String name; //名称
  final String text; //内容
  final String time; //时间
  final String isFabulous; //是否点赞
  final String fabulousCount; //点赞数
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
      onTap: () {
        Keyboardfocus.emit(true);
        return false;
      },

      child: Container(
        margin: EdgeInsets.only(left: 50.0),
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            new Container(
              width: 25.0,
              height: 25.0,
              child: CircleAvatar(
                backgroundImage: new NetworkImage(this.portrait),
              ),
            ),
            new Expanded(
              flex: 10,
              child: new Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      this.name,
                      style: TextStyle(
                          color: Color(0xFF909197),
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500),
                    ),
                    new Container(
                      height: 5.0,
                    ),
                    new Text.rich(TextSpan(children: [
                      new TextSpan(
                          text: this.text, style: TextStyle(fontSize: 14.0)),
                      new TextSpan(
                          text: this.time,
                          style: TextStyle(
                              color: Color(0xFFB9B9BD), fontSize: 14.0))
                    ]))
                  ],
                ),
              ),
            ),
            new Column(
              children: <Widget>[
                new InkWell(
                  child: new Icon(
                    Icons.favorite,
                    color: Color(0xFFDCDDDE),
                    size: 20,
                  ),
                  onTap: () {
                    print(1);
                  },
                ),
                new Text(
                  this.fabulousCount,
                  style: TextStyle(color: Color(0xFF939499), fontSize: 12.0),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _SulistState extends State<Sulist> {
  var Temt = <Widget>[
    new ItemReplySmall(
      portrait:
          "https://cdn2.jianshu.io/assets/default_avatar/6-fd30f34c8641f6f32f5494df5d6b8f3c.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96",
      name: "@喜欢和风大的不死",
      text: "最后的武士！？？？选十到劲十到劲射音 app ",
      time: "3小时前",
      isFabulous: "0",
      fabulousCount: "200",
    ),
    new ItemReplySmall(
      portrait:
          "https://cdn2.jianshu.io/assets/default_avatar/6-fd30f34c8641f6f32f5494df5d6b8f3c.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96",
      name: "@喜欢和风大的不死",
      text: "最后的武士！？？？选十到劲十到劲射音 app ",
      time: "3小时前",
      isFabulous: "0",
      fabulousCount: "200",
    ),
    new ItemReplySmall(
      portrait:
          "https://cdn2.jianshu.io/assets/default_avatar/6-fd30f34c8641f6f32f5494df5d6b8f3c.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96",
      name: "@喜欢和风大的不死",
      text: "最后的武士！？？？选十到劲十到劲射音 app ",
      time: "3小时前",
      isFabulous: "0",
      fabulousCount: "200",
    ),
    new ItemReplySmall(
      portrait:
          "https://cdn2.jianshu.io/assets/default_avatar/6-fd30f34c8641f6f32f5494df5d6b8f3c.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96",
      name: "@喜欢和风大的不死",
      text: "最后的武士！？？？选十到劲十到劲射音 app ",
      time: "3小时前",
      isFabulous: "0",
      fabulousCount: "200",
    ),
    new ItemReplySmall(
      portrait:
          "https://cdn2.jianshu.io/assets/default_avatar/6-fd30f34c8641f6f32f5494df5d6b8f3c.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96",
      name: "@喜欢和风大的不死",
      text: "最后的武士！？？？选十到劲十到劲射音 app ",
      time: "3小时前",
      isFabulous: "0",
      fabulousCount: "200",
    ),
    new ItemReplySmall(
      portrait:
          "https://cdn2.jianshu.io/assets/default_avatar/6-fd30f34c8641f6f32f5494df5d6b8f3c.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96",
      name: "@喜欢和风大的不死",
      text: "最后的武士！？？？选十到劲十到劲射音 app ",
      time: "3小时前",
      isFabulous: "0",
      fabulousCount: "200",
    ),
    new ItemReplySmall(
      portrait:
          "https://cdn2.jianshu.io/assets/default_avatar/6-fd30f34c8641f6f32f5494df5d6b8f3c.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96",
      name: "@喜欢和风大的不死",
      text: "最后的武士！？？？选十到劲十到劲射音 app ",
      time: "3小时前",
      isFabulous: "0",
      fabulousCount: "200",
    ),
    new ItemReplySmall(
      portrait:
          "https://cdn2.jianshu.io/assets/default_avatar/6-fd30f34c8641f6f32f5494df5d6b8f3c.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96",
      name: "@喜欢和风大的不死",
      text: "最后的武士！？？？选十到劲十到劲射音 app ",
      time: "3小时前",
      isFabulous: "0",
      fabulousCount: "200",
    ),
    new ItemReplySmall(
      portrait:
          "https://cdn2.jianshu.io/assets/default_avatar/6-fd30f34c8641f6f32f5494df5d6b8f3c.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96",
      name: "@喜欢和风大的不死",
      text: "最后的武士！？？？选十到劲十到劲射音 app ",
      time: "3小时前",
      isFabulous: "0",
      fabulousCount: "200",
    ),
    new ItemReplySmall(
      portrait:
          "https://cdn2.jianshu.io/assets/default_avatar/6-fd30f34c8641f6f32f5494df5d6b8f3c.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96",
      name: "@喜欢和风大的不死",
      text: "最后的武士！？？？选十到劲十到劲射音 app ",
      time: "3小时前",
      isFabulous: "0",
      fabulousCount: "200",
    ),
    new ItemReplySmall(
      portrait:
          "https://cdn2.jianshu.io/assets/default_avatar/6-fd30f34c8641f6f32f5494df5d6b8f3c.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96",
      name: "@喜欢和风大的不死",
      text: "最后的武士！？？？选十到劲十到劲射音 app ",
      time: "3小时前",
      isFabulous: "0",
      fabulousCount: "200",
    ),
    new ItemReplySmall(
      portrait:
          "https://cdn2.jianshu.io/assets/default_avatar/6-fd30f34c8641f6f32f5494df5d6b8f3c.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96",
      name: "@喜欢和风大的不死",
      text: "最后的武士！？？？选十到劲十到劲射音 app ",
      time: "3小时前",
      isFabulous: "0",
      fabulousCount: "200",
    ),
    new ItemReplySmall(
      portrait:
          "https://cdn2.jianshu.io/assets/default_avatar/6-fd30f34c8641f6f32f5494df5d6b8f3c.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96",
      name: "@喜欢和风大的不死",
      text: "最后的武士！？？？选十到劲十到劲射音 app ",
      time: "3小时前",
      isFabulous: "0",
      fabulousCount: "200",
    ),
    new ItemReplySmall(
      portrait:
          "https://cdn2.jianshu.io/assets/default_avatar/6-fd30f34c8641f6f32f5494df5d6b8f3c.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96",
      name: "@喜欢和风大的不死",
      text: "最后的武士！？？？选十到劲十到劲射音 app ",
      time: "3小时前",
      isFabulous: "0",
      fabulousCount: "200",
    ),
    new ItemReplySmall(
      portrait:
          "https://cdn2.jianshu.io/assets/default_avatar/6-fd30f34c8641f6f32f5494df5d6b8f3c.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96",
      name: "@喜欢和风大的不死",
      text: "最后的武士！？？？选十到劲十到劲射音 app ",
      time: "3小时前",
      isFabulous: "0",
      fabulousCount: "200",
    ),
    new ItemReplySmall(
      portrait:
          "https://cdn2.jianshu.io/assets/default_avatar/6-fd30f34c8641f6f32f5494df5d6b8f3c.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96",
      name: "@喜欢和风大的不死",
      text: "最后的武士！？？？选十到劲十到劲射音 app ",
      time: "3小时前",
      isFabulous: "0",
      fabulousCount: "200",
    ),
  ];

  int page = 0;
  int defultLoad = 2;
  bool isLoad = true;
  var Lists = <Widget>[];

  void moreLoad() {
    setState(() {
      if (isLoad) {
        page++;
      } else {
        page--;
      }
      isLoad = !isLoad;
    });
    setState(() {
      Lists.insertAll(Lists.length - 1, [
        Temt[0],
        Temt[1],
      ]);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Lists.addAll([
      new ItemReplySmall(
        portrait:
            "https://cdn2.jianshu.io/assets/default_avatar/6-fd30f34c8641f6f32f5494df5d6b8f3c.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96",
        name: "@喜欢和风大的不死",
        text: "最后的武士！？？？选十到劲十到劲射音 app ",
        time: "3小时前",
        isFabulous: "0",
        fabulousCount: "200",
      ),
      new InkWell(
        onTap: () {
          moreLoad();

        },
        child: new Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 100.0),
          child: new Row(
            children: <Widget>[
              new Text(
                "查看更多",
                style: TextStyle(color: Color(0xFF909197)),
              ),
              new Icon(
                Icons.vertical_align_bottom,
                color: Color(0xFF909197),
                size: 15,
              )
            ],
          ),
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Stack(
        children: <Widget>[
          new Column(
            children: Lists,
          ),
        ],
      ),
    );
  }
}
