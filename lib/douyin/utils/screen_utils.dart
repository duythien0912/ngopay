import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @author jd
/*
  ScreenUtil.pixelRatio       //设备的像素密度
    ScreenUtil.screenWidth      //设备宽度
    ScreenUtil.screenHeight     //设备高度
    ScreenUtil.bottomBarHeight  //底部安全区距离，适用于全面屏下面有按键的
    ScreenUtil.statusBarHeight  //状态栏高度 刘海屏会更高  单位px
    ScreenUtil.textScaleFactor //系统字体缩放比例
    
    ScreenUtil().scaleWidth  // 实际宽度的dp与设计稿px的比例
    ScreenUtil().scaleHeight // 实际高度的dp与设计稿px的比例
*/

double get_screenWidth() {
  return ScreenUtil().screenWidth;
}

double get_screenHeight() {
  return ScreenUtil().screenHeight;
}

double get_statusBarHeight() {
  return ScreenUtil().statusBarHeight;
}

double get_navigationHeight() {
  return kToolbarHeight + get_statusBarHeight();
}

double get_Sp(double fontSize) {
  return ScreenUtil().setSp(fontSize);
}

/// 设置宽度
double get_Width(double width) {
  return ScreenUtil().setWidth(width);
}

/// 设置宽度
double get_Height(double height) {
  return ScreenUtil().setHeight(height);
}

/// 设置字体尺寸
double get_FontSize(double fontSize) {
  return ScreenUtil().setSp(fontSize);
}
