
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/forgot_password_state.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/validators.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/shaker.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/text_field_widget.dart';

import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';

import '../../../../router/app_routes.dart';
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
 late GlobalKey <FormState> emailKey;
late GlobalKey<ShakeWidgetState> shakeEmail;
 @override
  void initState() {
    super.initState();
   emailKey=GlobalKey<FormState>();
   shakeEmail=GlobalKey<ShakeWidgetState>();
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
           width: Sizer.w(context, 1),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: emailKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                    Text(
                      "Enter your email to reset code",
                      style: AppTextStyle.appHintStyle.copyWith(
                      color:const Color(0xff241332).withOpacity(0.32),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),),
                  SizedBox(height: 36.h,),
                  ShakeWidget(
                    shakeOffset: 10,
                    key: shakeEmail,
                    child: Consumer(
                      builder: (context,ref,_) {
                        return TextFieldWidget(

                          hintText: 'Email',
                         onChanged: (emailValue){
                            ref.watch(forgotPasswordEmailProvider.notifier).state=
                                emailValue;
                            print(ref.watch(forgotPasswordEmailProvider));
                         },
                         validator:  (value) {
                           if (value!.isValidEmail) {
                             return null;
                           } else {
                             shakeEmail.currentState!.animationController.forward();
                             return 'Email field is required';
                           }
                         },
                        );
                      }
                    ),
                  ),
                  SizedBox(
                height:36.h
          ),
                  AppButtons(buttonText: 'CONTINUE',
                      buttonColor:AppColors.primaryColor,
                      onPressed:(){
                        if (emailKey.currentState!.validate()) {
                          Navigator.pushNamed(context, ENTER_CODE);
                          // AutoRouter.of(context).push(EnterCodeRoute());
                        } else {
                        }
                      },
                      height: 52.h,
                      width:327.w,
                     buttonTextStyle: AppTextStyle.buttonTextStyle.copyWith(
                       color: Colors.white,
                       fontSize: 14.sp,
                       fontWeight: FontWeight.w600
                     ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
