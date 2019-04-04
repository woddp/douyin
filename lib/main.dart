import 'package:flutter/material.dart';
import 'package:flutter_douyin/pages/index.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_douyin/common/plugin.dart';

import './pages/common/wBottomSheet.dart'; //回复列表
void main() {
  runApp(MyApp());

}
class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(

        ),
        fontFamily:'wryh',
        accentColor: Plugin.createMaterialColor(0xFFFFFFFF),
        iconTheme: IconThemeData(color: Plugin.createMaterialColor(0xFFFFFFFF)), //用于Icon颜色
        primaryColor:Plugin.createMaterialColor(0xFF161823) ,
        primarySwatch:Plugin.createMaterialColor(0xFF161823),
        backgroundColor:Plugin.createMaterialColor(0xFF161823)
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  AnimationController _animationController;
  initState(){
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new WBottomSheet(body:  new Index()),
    );

  }
}
