import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'dart:math' as math;
import '../../../../style/app_images.dart';

class AppLogo extends StatefulWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))
          ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return CircleAvatar(
            backgroundColor: const Color(0xffD0D0E7).withOpacity(0.1),
            child: SizedBox(
              height: (192.w),
              width: (192.w),
              child: CircleAvatar(
                backgroundColor: const Color(0xff8797C8).withOpacity(0.4),
                child: SizedBox(
                  height: (140.w),
                  width: (140.w),
                  child: CircleAvatar(
                    backgroundColor: const Color(0xff6D7EB4),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 43.6.h,
                          ),
                          SizedBox(
                            width: (37.25.w),
                            height: (13.56.h),
                            child: SvgPicture.asset(AppImages.logoWhite),
                          ),
                          SizedBox(
                            height: 6.1.h,
                          ),
                          SizedBox(
                            width: (37.25.w),
                            height: (13.56.h),
                            child: SvgPicture.asset(AppImages.logoWhite),
                          ),
                          SizedBox(
                            height: 6.1.h,
                          ),
                          SizedBox(
                            width: (37.25.w),
                            height: (13.56.h),
                            child: SvgPicture.asset(AppImages.logoWhite),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
class ApplicationLogo extends StatefulWidget {
  const ApplicationLogo({Key? key}) : super(key: key);

  @override
  State<ApplicationLogo> createState() => _ApplicationLogoState();
}

class _ApplicationLogoState extends State<ApplicationLogo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 238.h,
      width: 238.w,
      child: RippleAnimation(
        minRadius: 90,
        ripplesCount: 3,
        repeat: true,
        color: AppColors.primaryColor,
        duration:const Duration(milliseconds: 2000),
        child: SizedBox(
          height: (140.w),
          width: (140.w),
          child: CircleAvatar(
            backgroundColor: const Color(0xff6D7EB4),
            child: Center(
              child: SizedBox(
                  height: (52.81).h,//Sizer.h(context, 0.23),
                  width: (37.25).w,
                  child: SvgPicture.asset(AppImages.getStarted,color:const Color(0xffD5DBEE),))
            ),
          ),
        ),
      ),
    );
  }
}

