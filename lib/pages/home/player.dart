import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

typedef onPlayerType = void Function(
  Function _controller,
);

//typedef onPlayerType = void Function(VideoPlayerController controller);
class Player extends StatefulWidget {
  final onPlayerType onPlayer;

  Player({Key key, @required this.onPlayer}) : super(key: key);
  @override
  _PlayrtState createState() => new _PlayrtState();
}

class _PlayrtState extends State<Player> {
  VideoPlayerController _controller;
  VideoPlayerController _prevController;
  bool _isLoad;
  Timer time = null;
  List<Map<String, String>> playTimeArr = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoad = true;
    });
    widget.onPlayer(startPlay);
  }

  startPlay(String url)  {

    if (time != null) {
        time.cancel();
    }
    if(_controller!=null){
//      _controller.dispose();
//      setState(() {
//        _controller=null;
//      });
    }
    run(url);
    setState(() {
      time = Timer(Duration(seconds: 1), () {

      });
    });
  }
  void run(String url) {
     setState(() {
       _prevController=_controller;
       _controller=null;
       _controller = VideoPlayerController.network(url);

     });
    _controller.initialize().then((_) {
      //刷新页面显示播放器
      _controller.setLooping(true);
      _controller.play();
    });

    _controller.addListener(() {
      if(_prevController!=null){
        _prevController.dispose();
        setState(() {
          _prevController=null;
        });
      }
        String curTime = _controller.value.position.toString().split(".")[0];
        setState(() {
          playTimeArr.insert(0, {'time': curTime});
        });
        if (playTimeArr.length >= 11) {
          setState(() {
            playTimeArr.removeLast();
          });
        }
        if (playTimeArr.length > 7 &&
            (playTimeArr[0]['time'] == playTimeArr[2]['time'])) {
          setState(() {
            _isLoad = true;
          });
        } else {
          setState(() {
            _isLoad = false;
          });
        }

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        });
        return false;
      },
      child: Stack(
        children: <Widget>[
          _controller != null && _controller.value.initialized
              ? Align(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child:VideoPlayer(_controller),
                  ),
                )
              : Container(),
                new Container(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        color: Color.fromRGBO(000, 000, 000, 0.2),
                ),
        ],
      ),
    );
  }

  void dispose() {
    super.dispose();
    if(_controller!=null){
      _controller.dispose();
    }
  }
}
