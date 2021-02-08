import 'package:Vendor_app/src/styles/colors.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseStyles {
  static double get borderRadius => 10.0;

  static double get borderWidth => 2.0;
  static double get listFiledHorizontal => 8.0;
  static double get listFiledVertical => 8.0;

  static EdgeInsets get listPadding {
    return EdgeInsets.symmetric(
        horizontal: listFiledHorizontal, vertical: listFiledVertical);
  }

  static List<BoxShadow> get boxShadow {
    return [
      BoxShadow(
        color: AppColors.darkgray.withOpacity(.5),
        offset: Offset(1.0, 2.0),
        blurRadius: 2.0,
      )
    ];
  }
}
