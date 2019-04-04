import 'package:flutter/material.dart';

class Plugin{

  static  MaterialColor   createMaterialColor(int _redPrimaryValue){
    MaterialColor red = MaterialColor(
      _redPrimaryValue,
      <int, Color>{
        50: Color(_redPrimaryValue),
        100: Color(_redPrimaryValue),
        200: Color(_redPrimaryValue),
        300: Color(_redPrimaryValue),
        400: Color(_redPrimaryValue),
        500: Color(_redPrimaryValue),
        600: Color(_redPrimaryValue),
        700: Color(_redPrimaryValue),
        800: Color(_redPrimaryValue),
        900: Color(_redPrimaryValue),
      },
    );
    return red;
  }
}