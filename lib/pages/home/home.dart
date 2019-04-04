import 'package:flutter/material.dart';
import 'package:flutter_douyin/pages/home/player.dart';
import '../common/wAppBar.dart';
import 'rightOption.dart';
import 'bottomInfo.dart';
import 'head.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  PageController _pageController;

  int prevIndex = 0;
  int listLength = 0;
  int curIndex = 0;

  //播放器对象
  Function playFunction = null;

  List<Map<String, String>> list = [
    {
      "img": "http://woddp.yxilin.com/static/mp4/2.jpg",
      "url": "http://qiy.woddp.yxilin.com/2.mp4",
    },
    {
      "img": "http://woddp.yxilin.com/static/mp4/3.jpg",
      "url": "http://qiy.woddp.yxilin.com/1.mp4",
    },
    {
      "img": "http://woddp.yxilin.com/static/mp4/1.jpg",
      "url": "http://qiy.woddp.yxilin.com/3.mp4",
    },
  ];

  @override
  void initState() {
    super.initState();
    run();
  }

  void run() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new ConstrainedBox(
        //ConstrainedBox 限制容器
        constraints: BoxConstraints.expand(),
        child: new Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[

            new PageView.builder(
                controller: _pageController,
                itemCount: list.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, index) {
                  return new Stack(
                    overflow: Overflow.clip,
                    children: <Widget>[
                      new Container(
                        child: new Player(
                          onPlayer: (startPlay) {
                            playFunction = startPlay;
                            playFunction(list[index]['url']);
                          },
                        ),
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new NetworkImage(
                                list[index]['img'],
                              ),
                            ),
                            color: Theme.of(context).backgroundColor),
                      ),
                      //左侧，
                      new RightOption(),

                      //底部消息
                      new BottomInfo(),

                    ],
                  );
                }),
            //头部
            new Head(),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}
