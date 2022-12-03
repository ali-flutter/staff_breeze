import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/sign_in.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';

import '../../../../injection_container/injection.dart';
import '../../../../style/app_text_style.dart';
import '../../../welcoming_pages/presentation/business_logic/register_simple_statie_controller/register_controller.dart';
import '../cubit/sign_in_cubit.dart';
import '../cubit/sign_up_cubit.dart';
import '../widgets/sign_up.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            SizedBox(
              height: 37.h,
            ),
            SizedBox(
              height: 48.h,
              width: Sizer.w(context, 1),
              child: Center(
                child: Container(
                  height: 48.h,
                  width: 375.w,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 55.w,
                        ),
                        //   SizedBox(width: 93.w,),
                        Consumer(builder: (context, ref, _) {
                          return ref.watch(isSignUp) == false
                              ? AppButtons(
                                  buttonText: 'SIGN IN',
                                  buttonColor:const Color(0xff6D7EB4),
                                  onPressed: () {
                                    ref.watch(isSignUp.notifier).state = false;
                                  },
                                  height: 42.h,
                                  width: 70.w,
                                  buttonTextFontFamily: 'montserrat',
                                  buttonTextStyle: AppTextStyle.buttonTextStyle
                                      .copyWith(
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,),)
                              : GestureDetector(
                                  onTap: () {
                                    ref.watch(isSignUp.notifier).state = false;
                                  },
                                  child: SizedBox(
                                    height: 42.h,
                                    width: 100.w,
                                    child: Center(
                                      child: Text(
                                        'SIGN IN',
                                        style: AppTextStyle.buttonTextStyle
                                            .copyWith(
                                                color: const Color(0xff998FA2),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                );
                        }),
                        SizedBox(
                          width: 5.w,
                        ),
                        Consumer(builder: (context, ref, _) {
                          return ref.watch(isSignUp) == true
                              ? AppButtons(
                                  buttonText: 'SIGN UP',
                                  buttonColor:const Color(0xff6D7EB4),
                                  onPressed: () {
                                    ref.watch(isSignUp.notifier).state = true;
                                  },
                                  height: 42.h,
                                  width: 70.w,
                                  buttonTextFontFamily: 'montserrat',
                                  buttonTextStyle: AppTextStyle.buttonTextStyle
                                      .copyWith(
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600))
                              : GestureDetector(
                                  onTap: () {
                                    ref.watch(isSignUp.notifier).state = true;
                                  },
                                  child: SizedBox(
                                    height: 42.h,
                                    width: 100.w,
                                    child: Center(
                                      child: Text(
                                        'SIGN UP',
                                        style: AppTextStyle.buttonTextStyle
                                            .copyWith(
                                                color: const Color(0xff998FA2),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                );
                        }),
                        SizedBox(
                          width: 55.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 57.h,
            ),
            Consumer(
                builder: (context, ref, _) => ref.watch(isSignUp) == false
                    ? const SignInWidget()
                    : const SignUpWidget())
          ],
        ),
      ),
    );
  }

}
