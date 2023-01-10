import 'package:flutter/material.dart';
import 'package:staff_breeze/style/app_text_style.dart';

class ButtonWithLoading extends StatelessWidget {
  ButtonWithLoading(
      {Key? key,
        this.loading = true,
        required this.buttonText,
        this.buttonTextStyle = AppTextStyle.buttonTextStyle,
        required this.buttonColor,
        required this.onPressed,
        this.roundingValue = 35,
        required this.height,
        required this.width,
        this.buttonTextFontFamily = 'raleway'})
      : super(key: key);
  final bool? loading;
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
    return SizedBox(
      width: width - 30,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(roundingValue),
            ),
          ),
        ),
        onPressed: loading! ? () {} : onPressed,
        child: Center(
          child: SizedBox(
            height: height,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                loading!
                    ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
                    : Text(
                  buttonText,
                  style: buttonTextStyle.copyWith(fontFamily: buttonTextFontFamily),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
