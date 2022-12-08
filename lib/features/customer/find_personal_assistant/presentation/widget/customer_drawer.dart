import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../router/app_routes.dart';
import '../../../../../style/app_images.dart';
import '../../../../../style/app_text_style.dart';

class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 734.h,
      width: 334.w,
      decoration: const BoxDecoration(
          color: Color(0xff181928),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(90),
            bottomRight: Radius.circular(50),
          )),
      child: SizedBox(
        width: 334.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 40.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 36.h,
                  ),
                  SizedBox(
                    height: 64.w,
                    width: 64.w,
                    child: Image.asset(
                      AppImages.drawer_png,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Aurélien Salomon',
                    style: AppTextStyle.whiteBold.copyWith(
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    '@Aurélien Salomon',
                    style: AppTextStyle.appHintStyle.copyWith(
                        color:const Color(0xff707070),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 21.w),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, CUSTOMER_PROFILE);
                     // Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: Image.asset(AppImages.house_icon),
                        ),
                        SizedBox(
                          width: (18.9).w,
                        ),
                        Text(
                          'Profile',
                          style: AppTextStyle.whiteBold.copyWith(
                              fontSize: 16.sp, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, JOB_HISTORY);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: Image.asset(AppImages.hand_money),
                        ),
                        SizedBox(
                          width: (18.9).w,
                        ),
                        Text(
                          'Job History',
                          style: AppTextStyle.whiteBold.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, CONTACT_SUPPORT);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: Image.asset(AppImages.user_icon),
                        ),
                        SizedBox(
                          width: (18.9).w,
                        ),
                        Text(
                          'Contact support',
                          style: AppTextStyle.whiteBold.copyWith(
                              fontSize: 16.sp, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 230.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, NEW_PASSWORD);
                        },
                        child: Text(
                          'Change Password',
                          style: AppTextStyle.appHintStyle.copyWith(
                              color: const Color(0xffFFFFFF).withOpacity(0.56),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, REGISTER, (route) => false);
                        },
                        child: Text(
                          'Log out',
                          style: AppTextStyle.appHintStyle.copyWith(
                              color: const Color(0xffFFFFFF).withOpacity(0.56),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
