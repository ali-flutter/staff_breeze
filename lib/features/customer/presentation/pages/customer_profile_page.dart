import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';

import '../../../../style/app_images.dart';
class CustomerProfilePage extends StatelessWidget {
  const CustomerProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 320.h,
                width: 375.w,
                color: AppColors.primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width:174.w,
                          height: 53.h,
                          child: Text('Customer',style: AppTextStyle.whiteBold.copyWith(
                            fontSize: 30.sp,
                          ),),
                        ),
                        Container(
                          height: 24.h,
                          width: 24.w,
                          decoration: const BoxDecoration(
                            color: Color(0xff343D58),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(AppImages.pen),
                          ),
                        ),
                      ],
                    ),
                    /*SizedBox(
                      height: 10.h,
                    ),*/
                    Text('Manager at Gegham',style: AppTextStyle.whiteBold.copyWith(
                      fontSize: 12.sp
                      ),),
                    SizedBox(
                      height: 26.h,
                    ),
                  ],
                ),
              ),
              Container(
                width: 375.w,
                height: 461.h,
                color: Color(0xff181928),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 27.h,
                    ),
                    Container(height: 44.h,
                    width: 208.53.w,
                      decoration: BoxDecoration(
                      color: Color(0xff515A75),
                      borderRadius: BorderRadius.circular(35),
                      ),
                     child:Padding(
                       padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 4.h),
                       child: AppButtons(
                         width: 158.w,
                         height: 36.h,
                         onPressed: (){},
                         buttonColor:AppColors.primaryColor ,
                         buttonText: 'ABOUT ME' ,
                         buttonTextStyle: AppTextStyle.buttonTextStyle.copyWith(
                           color: Colors.white,
                           fontSize: 12.sp,
                           fontWeight: FontWeight.bold
                         ),
                       ),
                     )
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    Container(
                      height: (285.88).h,
                      width: 344.w,
                      decoration: BoxDecoration(
                        color: Color(0xff515A75),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 29.w),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 29.h,
                            ),
                              Row(
                                children: [
                                  SizedBox(width: 20.w,),
                                  Text('About Me',style: AppTextStyle.appHintStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ],
                              ),
                            SizedBox(height: 14.h,),
                            Card(
                              color: Color(0xff515A75),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                  color:Colors.white,
                                ),
                              ),
                              elevation: 0,
                              child: SizedBox(
                                height:134.h,
                                //: 316.w,
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                                    child:  TextFormField(
                                      decoration: const InputDecoration(
                                        focusedBorder:
                                        UnderlineInputBorder(borderSide: BorderSide.none),
                                        border:
                                        UnderlineInputBorder(borderSide: BorderSide.none),
                                      ),
                                      onChanged: (codeValue){

                                      },

                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15.h,),
                            AppButtons(buttonText: 'SAVE CHANGES',
                                buttonColor: AppColors.primaryColor,
                                onPressed:(){},
                                height:36.h,
                                width:158.w,
                            buttonTextStyle: AppTextStyle.buttonTextStyle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      )

    );
  }
}
