import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/style/app_colors.dart';

abstract class AppTextStyle {
  static const buttonTextStyle = TextStyle(
      color: AppColors.primaryColor, fontSize: 14, fontWeight: FontWeight.w600);

  static final TextStyle ironExtraBig = TextStyle(
    color: const Color(0xff352641),
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
  );
  static final smallGrey = TextStyle(
    color: const Color(0xff767676),
    fontSize: 14.h,
    fontWeight: FontWeight.normal,
  );
  static final appHintStyle = TextStyle(
    color: const Color(0xff241332).withOpacity(0.3),
    fontSize: 16.sp,
    fontFamily: 'montserrat',
    fontWeight: FontWeight.w500,
  );
  static final lightMainColor = TextStyle(
      color: const Color(0xff6D7EB4),
      fontSize: 12.sp,
      fontWeight: FontWeight.w600);
  static final mediumGrey = TextStyle(
      color: const Color(0xff7A869A).withOpacity(0.6),
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      height: 1.5);
  static final blackMedium = TextStyle(
    color: const Color(0xff333333),
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static final whiteBold = TextStyle(
    color: Colors.white,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    height: 1.5,
  );
  static final regularGrey = TextStyle(
    color:const Color(0xffffffff).withOpacity(0.56),
    fontSize: 12.sp,
    fontWeight: FontWeight.w400
  );
  static final blackBold=TextStyle(
    color: Colors.black,
    fontSize: 26.sp,
    fontWeight: FontWeight.bold
  );

}
