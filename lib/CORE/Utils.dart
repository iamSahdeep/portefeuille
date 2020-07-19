import 'package:flutter/material.dart';

class Utils {
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static bool isMobileView(BuildContext context) {
    return getWidth(context) < 700 || getHeight(context) > getWidth(context);
  }

  static double getCursorMainScreenWithRangeW(double da, BuildContext context) {
    return (((da) * (getWidth(context) - 400)) / (getWidth(context)));
  }

  static double getCursorMainScreenWithRangeH(double da, BuildContext context) {
    return (((da) * (getHeight(context) - 400)) / (getHeight(context)));
  }
}
