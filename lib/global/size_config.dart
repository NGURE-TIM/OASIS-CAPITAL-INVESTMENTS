import 'package:flutter/widgets.dart';
class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late  double blockSizeVertical;

   void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }

  static responsiveHeightSize(int height) {
    late double Size;
    Size= height/ screenHeight;
    return Size;

  }
  static responsiveWidthSize(int width) {
    late double Size;
    Size= width/screenWidth;
    return Size ;
  }
}