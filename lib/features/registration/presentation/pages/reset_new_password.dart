import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/text_field_widget.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';
class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(
                height:131.h,
              ),
              const TextFieldWidget(hintText: 'New Password'),
              SizedBox(height: 31.h,),
              const TextFieldWidget(hintText: 'Confirm New Password'),
              SizedBox(
                height: 49.h,
              ),
              AppButtons(
                  buttonText: 'Confirm',
                  buttonColor: AppColors.primaryColor,
                  onPressed:(){

                  },
                  height: 52.h,
                  width: 327.w,
                buttonTextStyle: AppTextStyle.buttonTextStyle.copyWith(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
