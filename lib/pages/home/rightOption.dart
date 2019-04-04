import 'package:flutter/material.dart';
import '../common/msg/list.dart'; //回复列表
import 'package:flutter_douyin/store/store.dart';
class RightOption extends StatefulWidget {
  bool isFollow; //关注
  bool isFavorite; //收藏
  RightOption({Key key, isFollow, isFavorite})
      : isFollow = isFollow == null ? false : true,
        isFavorite = isFavorite == null ? false : true,
        super();

  @override
  _RightOptionState createState() => new _RightOptionState();
}

class _RightOptionState extends State<RightOption>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  int index = 0; //当点点击的index
  TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 15.0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 35.0, end: 25.0).animate(_animationController);
    _animation.addListener(() {
      setState(() {});
    });
  }

  Future<Null> _playAnimtion() async {
    await _animationController.forward().orCancel;
    await _animationController.reverse().orCancel;
  }

  Widget iconWidget(int i, String src, String text, Function fun) {
    return new InkWell(
      onTap: () {
        setState(() {
          index = i;
        });
        _playAnimtion();
        fun();
      },
      child: new Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: new Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.center,
              height: 40.0,
              child: new Image.asset(
                src,
                width: index == i ? _animation.value : 35,
              ),
            ),
            new Container(
              height: 10.0,
            ),
            new Text(
              text,
              style: textStyle,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Positioned(
      right: 10.0,
      bottom: 0.0,
      width: 50.0,
      child: new Column(
        children: <Widget>[
          new InkWell(
            child: new Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: new Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      new Image.asset(
                        'assets/images/defaultTx.png',
                        width: 50.0,
                      ),
                      new Container(
                        height: 10.0,
                      ),
                    ],
                  ),
                  new Positioned(
                    bottom: 0,
                    left: 16,
                    child: new Image.asset(
                      widget.isFollow
                          ? 'assets/images/add-on.png'
                          : 'assets/images/add.png',
                      width: 20.0,
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              setState(() {
                widget.isFollow = !widget.isFollow;
              });
            },
          ),
          new InkWell(
            onTap: () {
              _playAnimtion();
              setState(() {
                index = 0;
                widget.isFavorite = !widget.isFavorite;
              });
            },
            child: new Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: new Column(
                children: <Widget>[
                  new Container(
                    alignment: Alignment.center,
                    height: 40.0,
                    child: new Image.asset(
                      widget.isFavorite
                          ? 'assets/images/followOn.png'
                          : 'assets/images/followOff.png',
                      width: index == 0 ? _animation.value : 35,
                    ),
                  ),
                  new Container(
                    height: 10.0,
                  ),
                  new Text(
                    "9.3w",
                    style: textStyle,
                  )
                ],
              ),
            ),
          ),
          iconWidget(1, 'assets/images/reply.png', '9.3w', () {
            WBottomSheel.emit(true);
//            showModalBottomSheet(
//                context: context,
//                builder: (BuildContext context) {
////                  return new ListMsg();
//                }).then((v) {
//              print(v);
//            });
          }),
          iconWidget(2, 'assets/images/share.png', '9.3w', () {}),
          new Container(
            height: 110.0,
          )
        ],
      ),
    );
  }
}
