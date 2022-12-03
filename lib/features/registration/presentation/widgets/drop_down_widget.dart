import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../style/app_colors.dart';
import '../../../../style/app_text_style.dart';

class DropdownWidget extends StatelessWidget {
   DropdownWidget({Key? key,required this.hint,required this.items}) : super(key: key);
   String hint;
   List<String>items;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        dropdownColor: AppColors.primaryColor,
        elevation: 0,

        borderRadius: BorderRadius.circular(20.r),
        iconSize: 28.sp,
        iconEnabledColor:const Color(0xff998FA2),
        iconDisabledColor:const Color(0xff998FA2) ,
        hint: Text(hint,style: AppTextStyle.appHintStyle,),
        decoration: InputDecoration(enabledBorder:UnderlineInputBorder(
            borderSide:BorderSide(color:const Color(0xffDDDDDD),
            width: 1.5.h
            )
        ) ,
          border: UnderlineInputBorder(
              borderSide:BorderSide(color:const Color(0xffDDDDDD),
                  width: 1.5.h)
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide:BorderSide(color:const Color(0xffDDDDDD),
                width: 1.5.h)
          )
        ),
        items:items.map((item) => DropdownMenuItem(
          value:item,
          child: Text(item,style: AppTextStyle.whiteBold.copyWith(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400
          ),),),).toList(),
        onChanged: (c){});
  }
}
