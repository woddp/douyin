import 'dart:async';

import 'package:flutter/services.dart';

class FlutterKeyboardListen {
  static const MethodChannel _channel =
      const MethodChannel('flutter_keyboard_listen');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
