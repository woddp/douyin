import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

import 'startBtn.dart';

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;
  List<CameraDescription> cameras;

  bool isFrontAfter=true;//true 后  false 前

  @override
  void initState() {
    super.initState();
    getTemporaryDirectory().then((dir) {
      print(dir.path);
    });
    getExternalStorageDirectory().then((directory) {
      print(directory.path);
      initCameras(isFrontAfter?0:1);
    });
  }

  Future<void> initCameras(index) async {
    cameras = await availableCameras();
    print(cameras);
    controller = CameraController(cameras[index], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }

//      controller.startVideoRecording('./video.mp4');
      setState(() {});
    });
  }

  Future<String> getRootPatg() async {
    return (await getExternalStorageDirectory()).path;
  }

  String videoPath;

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  VoidCallback videoPlayerListener;
  VideoPlayerController videoController;

  Future<String> startVideoRecording() async {
    final String extDir = await getRootPatg();
    final String dirPath = '${extDir}/DouyinMovies/flutter_test';
//    await Directory(dirPath).create(recursive: true);

    final String filePath = '$dirPath/${timestamp()}.mp4';
    File file = new File(filePath);

    if (controller.value.isRecordingVideo) {
      // A recording is already started, do nothing.
      return null;
    }
    try {
      videoPath = filePath;
      await controller.startVideoRecording(file.path);
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
    return filePath;
  }

  Future<void> stopVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await controller.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }

    await _startVideoPlayer();
  }

  Future<void> _startVideoPlayer() async {
    final VideoPlayerController vcontroller =
        VideoPlayerController.file(File(videoPath));
    videoPlayerListener = () {
      if (videoController != null && videoController.value.size != null) {
        // Refreshing the state to update video player with the correct ratio.
        if (mounted) setState(() {});
        videoController.removeListener(videoPlayerListener);
      }
    };
    vcontroller.addListener(videoPlayerListener);
    await vcontroller.setLooping(true);
    await vcontroller.initialize();
    await videoController?.dispose();
    if (mounted) {
      setState(() {
        videoController = vcontroller;
      });
    }
    await vcontroller.play();
  }

  ///错误处理
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void logError(String code, String message) =>
      print('Error: $code\nError Message: $message');

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }

  void showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> start() async {}

  @override
  void dispose() {
    controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new Container(
        height: double.maxFinite,
        child: new Stack(
          children: <Widget>[
            new Container(
              width: double.maxFinite,
              height: double.maxFinite,
              child: new Container(
                color: Colors.black,
                child: new Align(
                  child:controller != null && controller.value.isInitialized? AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: CameraPreview(controller)):Container(),
                ),
              ),
            ),
            new Positioned(
//          top: 0.0,
              left: 0.0,
              bottom: 40.0,
              child: new Container(
                width: MediaQuery.of(context).size.width,
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      flex: 1,
                      child: Container(
                        child: new RaisedButton(
                          onPressed: () {},
                          child: Icon(Icons.brightness_1),
                        ),
                      ),
                    ),
                    new Expanded(
                      flex: 1,
                      child: new StartBtn(),
                    ),
                    new Expanded(
                      flex: 1,
                      child: Container(
                        child: new RaisedButton(
                          onPressed: () {},
                          child: Icon(Icons.brightness_1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //头部
            new Positioned(
              left: 0.0,
              top: MediaQuery.of(context).padding.top+30.0,
              child: new Container(
                width: MediaQuery.of(context).size.width,
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 20.0),
                        child: new Align(
                          alignment: Alignment.centerLeft,
                          child: new InkWell(
                            child: new Icon(Icons.close),
                          ),
                        ),
                      ),
                    ),
                    new Expanded(
                      flex: 1,
                      child: Container(

                      ),
                    ),
                    new Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(right: 20.0),
                        child: new Align(
                          alignment: Alignment.centerRight,
                          child: new InkWell(
                            onTap: (){
                              setState(() {
                                isFrontAfter=!isFrontAfter;
                              });
                              initCameras(isFrontAfter?0:1);
                            },
                            child: new Icon(Icons.camera_alt),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
