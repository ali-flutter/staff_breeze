import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/style/app_text_style.dart';
class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key? key,
    required this.hintText,
    this.validator,
    this.onChanged,
    this.textInputAction= TextInputAction.next,
    this.isDense=false,
    this.keyBoardType,
  }) : super(key: key);
  final String hintText;
  final textInputAction;
   final bool isDense;
   final TextInputType? keyBoardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
       keyboardType: keyBoardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        contentPadding:  EdgeInsets.symmetric(vertical: 8.h),
       // isDense: true,
        hintText: hintText,
        hintStyle: AppTextStyle.appHintStyle,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color:const Color(0xff352641),
              width: 2.h
            ),
          ),
        border:const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffDDDDDD)
          )
        ),


      ),cursorColor:const Color(0xffD47FA6),
      validator:validator ,
      onChanged:onChanged ,
    );
  }
}
