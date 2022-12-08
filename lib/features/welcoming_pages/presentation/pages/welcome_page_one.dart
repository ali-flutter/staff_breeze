import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/sign_up_state_controller.dart';
import 'package:staff_breeze/router/app_routes.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';
import '../../../../core/common_widgets/app_buttons.dart';
import '../../../../style/app_colors.dart';
import '../../../../style/app_images.dart';
import '../widget/app_logo.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  final ScrollController controller = ScrollController();

  GlobalKey secondViewKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F0F2),
      body: SafeArea(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                //the shadow image
                SizedBox(
                    width: double.infinity,
                    child: SvgPicture.asset(
                      AppImages.shadowImage,
                      fit: BoxFit.cover,
                    )),


                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /*SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),*/
                      SizedBox(
                        height: 89.h,
                      ),
                      SizedBox(
                        height: 520.h,
                        width: 327.w,
                        child: Material(
                          color: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(85),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 76.h),

                             Padding(
                               padding:  EdgeInsets.only(left: 90.w,top: 20.h),
                               child: SizedBox(
                                      height: 238.h,
                                      width: 238.w,
                                    // the rippled logo of the app
                                    child: ApplicationLogo()//const AppLogo()
                               ),
                             ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'Welcome to',
                                style: AppTextStyle.ironExtraBig,
                              ),
                              Text(
                                'STAFF BREEZE',
                                style: AppTextStyle.ironExtraBig,
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                'find your personal assistant.',
                                style: AppTextStyle.smallGrey,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                       // height:179.h,
                        width: Sizer.w(context, 1),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 111.h//Sizer.h(context, 0.13),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: Sizer.w(context, 1),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(),
                                            GestureDetector(
                                              onTap: () {
                                                Scrollable.ensureVisible(
                                                    secondViewKey.currentContext!);
                                              },
                                              child: Container(
                                                height: 56.h,
                                                width: 118.w,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xff6D7EB4),
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(35),
                                                    bottomLeft: Radius.circular(35),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 26.w,
                                                    ),
                                                    Text(
                                                      'NEXT',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    Icon(
                                                      Icons.arrow_forward_outlined,
                                                      color: Colors.white,
                                                      size: 24.sp,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                key: secondViewKey,
                                children: [
                                  SizedBox(
                                    height: 31.h,
                                    width: Sizer.w(context, 1),
                                  ),
                                  Consumer(
                                      builder: (context, ref, _) => AppButtons(
                                          buttonTextStyle:
                                              AppTextStyle.buttonTextStyle.copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12.sp),
                                          buttonText: 'CUSTOMER',
                                          buttonColor: const Color(0xff6D7EB4),
                                          onPressed: () {
                                            ref
                                                .watch(signUpAccountTypeIdProvider
                                                    .notifier)
                                                .state = 0;
                                            Navigator.pushNamed(context, REGISTER);
                                          },
                                          height: 49.h,
                                          width: 216.w,)),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Consumer(
                                    builder: (context, ref, _) => AppButtons(
                                      buttonTextStyle: AppTextStyle.buttonTextStyle
                                          .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.sp),
                                      buttonText: 'PERSONAL ASSISTANTS',
                                      buttonColor: const Color(0xff6D7EB4),
                                      onPressed: () {
                                        ref
                                            .watch(
                                                signUpAccountTypeIdProvider.notifier)
                                            .state = 1;
                                        Navigator.pushNamed(context, REGISTER);
                                      },
                                      height: 49.h,
                                      width: 216.w,
                                    ),
                                  ),
                                  SizedBox(height: 12.h,)
                                ],
                              )
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
      ),
    );
  }
}
