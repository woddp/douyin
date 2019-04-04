import 'package:flutter/material.dart';
class Rolling extends  StatefulWidget{
  final Widget child;
  @override
  Rolling( {this.child}):super();
  _RollingState createState()=>new _RollingState();
}
class _RollingState extends State<Rolling> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  Animation<Offset> _animation;
  @override
  void initState() {
//    _timer=Timer.periodic(Duration(seconds:5), (timer){
    _animationController=AnimationController(vsync: this,duration: Duration(seconds: 10));
    _animation=Tween<Offset>(begin: Offset(0.0, 0.0),end: Offset(-0.7, 0.0)).animate(_animationController);
    _animation.addListener((){
      setState(() {

      });
    });
    _animationController.reverse();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new Container(child: Scrollbar(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FractionalTranslation(
          translation: _animation.value,
          child: widget.child,
        ),
      ),
    ),
    );
  }
}