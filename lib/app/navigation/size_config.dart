import 'dart:developer';
import 'package:flutter/material.dart';

/// Ekran boyutlarını tutmak için yazıldı
class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double width;
  static late double height;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;
  static late double statusBarHeight = 0;
  static late EdgeInsets safeAreaPadding;
  static late double devicePixelRatio;
  static late double appBarHeight;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    width = _mediaQueryData.size.width;
    height = _mediaQueryData.size.height;
    blockSizeHorizontal = width / 100;
    blockSizeVertical = height / 100;
    _safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (width - _safeAreaHorizontal) / 100;
    safeBlockVertical = (height - _safeAreaVertical) / 100;
    safeAreaPadding = _mediaQueryData.padding;

    /// The number of device pixels for each logical pixel. This number might not
    devicePixelRatio = _mediaQueryData.devicePixelRatio;
    appBarHeight = kToolbarHeight;
    if (_mediaQueryData.padding.top != 0) {
      statusBarHeight = _mediaQueryData.padding.top;
    }
    log('${width * devicePixelRatio}x${height * devicePixelRatio}', name: 'Screen pixel');
  }

  void setScreenSizeFromConstraints(BoxConstraints constraints) {
    SizeConfig.width = constraints.maxWidth;
    SizeConfig.height = constraints.maxHeight;
    log('${SizeConfig.width}x${SizeConfig.height}', name: 'Screen local pixel');
  }
}
