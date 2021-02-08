import 'package:Vendor_app/src/styles/base.dart';
import 'package:Vendor_app/src/styles/buttons.dart';
import 'package:Vendor_app/src/styles/colors.dart';
import 'package:Vendor_app/src/styles/text.dart';
import 'package:flutter/widgets.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final ButtonType buttonType;
  AppButton({
    @required this.buttonText,
    this.buttonType,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle fontStyle;
    Color buttonColor;

    switch (buttonType) {
      case ButtonType.Straw:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.straw;
        break;
      case ButtonType.LightBlue:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.lightblue;
        break;
      case ButtonType.DarkBlue:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.darkblue;
        break;
      case ButtonType.LightGray:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.lightgray;
        break;
      case ButtonType.DarkGray:
        fontStyle = TextStyles.buttonTextDark;
        buttonColor = AppColors.darkgray;
        break;
      default:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.lightblue;
        break;
    }

    return Padding(
      padding: BaseStyles.listPadding,
      child: Container(
        height: ButtonStyles.buttonHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
          boxShadow: BaseStyles.boxShadow,
        ),
        child: Center(
            child: Text(
          buttonText,
          style: fontStyle,
        )),
      ),
    );
  }
}

enum ButtonType { LightBlue, Straw, LightGray, DarkGray, DarkBlue }
