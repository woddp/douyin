import 'BusEvent.dart';

//键盘弹出关闭监听
class  KeyboardStatus{
  static Function emit(double height){
    bus.emit('keyboardStatus', height);
  }
  static Function on(Function(double) callback){
    bus.on('keyboardStatus',(arg){
      callback(arg);
    });
  }
}

//触发键盘打开
class  Keyboardfocus{
  static Function emit(bool status){
    bus.emit('Keyboardfocus', status);
  }
  static Function on(Function(bool) callback){
    bus.on('Keyboardfocus',(arg){
      callback(arg);
    });
  }
}


class  WBottomSheel{
  static Function emit(bool status){
    bus.emit('WBottomSheel', status);
  }
  static Function on(Function(bool) callback){
    bus.on('WBottomSheel',(arg){
      callback(arg);
    });
  }
}