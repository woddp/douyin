package com.example.flutter_keyboard_listen;

import android.content.Context;
import android.graphics.Rect;
import android.util.Log;
import android.view.View;
import android.view.ViewTreeObserver;

import java.lang.reflect.Field;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterKeyboardListenPlugin */
public class FlutterKeyboardListenPlugin implements MethodCallHandler {

  public static int keyboardHeight = 0;
  boolean isVisiableForLast = false;
  ViewTreeObserver.OnGlobalLayoutListener onGlobalLayoutListener = null;









  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_keyboard_listen");
    channel.setMethodCallHandler(new FlutterKeyboardListenPlugin());
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {



      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else {
      result.notImplemented();
    }
  }
}
