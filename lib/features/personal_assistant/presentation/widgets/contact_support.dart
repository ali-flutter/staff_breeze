import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/text_field_widget.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';

class ContactSupportPage extends StatelessWidget {
  const ContactSupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height*1,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 269.h,
                    width: 375.w,
                    color:const Color(0xff343D58),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 72.h,
                        ),
                        Text(
                          'Contact Support',
                          style: AppTextStyle.whiteBold.copyWith(
                            color: Colors.white,
                            fontSize: 26.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Color(0xffF1F0F2),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          height: 367.h,
                        ),
                        AppButtons(
                          buttonText: 'SEND',
                          buttonColor: AppColors.primaryColor,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          height: 52.h,
                          width: 307.w,
                          buttonTextStyle: AppTextStyle.buttonTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),/*Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width*1,
                          color:  Color(0xffF1F0F2),
                        )*/
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 140.h,
                    ),
                    Container(
                      height: 448.h,
                      width: 327.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 66.h,
                            ),
                            TextFieldWidget(hintText: 'Name'),
                            SizedBox(
                              height: 42.h,
                            ),
                            TextFieldWidget(hintText: 'Email'),
                            SizedBox(
                              height: 44.h,
                            ),
                            TextFieldWidget(hintText: 'Message',),
                            TextFieldWidget(hintText: ''),
                            TextFieldWidget(hintText: ''),
                            TextFieldWidget(hintText: ''),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
