import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../style/app_text_style.dart';

class CompleteRegistrationTextField extends StatelessWidget {
  const CompleteRegistrationTextField({Key? key,required this.hintText,this.textInputAction=TextInputAction.done,required this.onChanged,required this.validator}) : super(key: key);
 final String hintText;
  final textInputAction;

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      textInputAction: textInputAction,
      decoration: InputDecoration(
        contentPadding:  EdgeInsets.symmetric(vertical: 8.h),
        isDense: true,
        hintText: hintText,
        hintStyle: AppTextStyle.appHintStyle,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color:const  Color(0xff707070),
              width: 0.2.h
          ),
        ),
        border: UnderlineInputBorder(
            borderSide: BorderSide(
                color:  Color(0xff707070),
              width: 0.2.h
            )
        ),


      ),cursorColor:const Color(0xffD47FA6),
      validator:validator ,
      onChanged:onChanged ,
    );
  }
}
