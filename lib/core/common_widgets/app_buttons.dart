import 'package:flutter/material.dart';
import 'package:staff_breeze/style/app_text_style.dart';

class AppButtons extends StatelessWidget {
  AppButtons(
      {Key? key,
      required this.buttonText,
      this.buttonTextStyle = AppTextStyle.buttonTextStyle,
      required this.buttonColor,
      required this.onPressed,
      this.roundingValue = 35,
      required this.height,
      required this.width,
        this.buttonTextFontFamily='raleway'
      })
      : super(key: key);
  final String buttonTextFontFamily;
  final String buttonText;
  TextStyle buttonTextStyle;
  final Color buttonColor;
  final double height;
  final double width;
  void Function()? onPressed;
  double roundingValue;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.all(buttonColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(roundingValue),
          ),
        ),
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: height,
        width: width,
        child: Center(
          child: Text(
            buttonText,
            style: buttonTextStyle.copyWith(fontFamily:buttonTextFontFamily ),
          ),
        ),
      ),
    );
  }
}
