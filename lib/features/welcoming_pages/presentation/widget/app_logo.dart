import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math'as math;
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
    _controller=AnimationController(vsync: this,duration:const Duration(seconds: 10 ))..repeat();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return
          CircleAvatar(
            backgroundColor: const Color(0xffD0D0E7).withOpacity(0.1),
            child: SizedBox(
              height: 192.h,
              width: 192.w,
              child: CircleAvatar(
                backgroundColor: const Color(0xff8797C8).withOpacity(0.4),
                child: SizedBox(
                  height: 140.h,
                  width: 140.w,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context,_){
                      return Transform.rotate(
                        angle: _controller.value*2*math.pi,
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
                                  width: 37.25.w,
                                  height: 13.56.h,
                                  child: SvgPicture.asset(AppImages.logoWhite),
                                ),
                                SizedBox(
                                  height: 6.1.h,
                                ),
                                SizedBox(
                                  width: 37.25.w,
                                  height: 13.56.h,
                                  child: SvgPicture.asset(AppImages.logoWhite),
                                ),
                                SizedBox(
                                  height: 6.1.h,
                                ),
                                SizedBox(
                                  width: 37.25.w,
                                  height: 13.56.h,
                                  child: SvgPicture.asset(AppImages.logoWhite),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ) ;
                      },
                    /*child: CircleAvatar(
                      backgroundColor: const Color(0xff6D7EB4),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 43.6.h,
                            ),
                            SizedBox(
                              width: 37.25.w,
                              height: 13.56.h,
                              child: SvgPicture.asset(AppImages.logoWhite),
                            ),
                            SizedBox(
                              height: 6.1.h,
                            ),
                            SizedBox(
                              width: 37.25.w,
                              height: 13.56.h,
                              child: SvgPicture.asset(AppImages.logoWhite),
                            ),
                            SizedBox(
                              height: 6.1.h,
                            ),
                            SizedBox(
                              width: 37.25.w,
                              height: 13.56.h,
                              child: SvgPicture.asset(AppImages.logoWhite),
                            ),
                          ],
                        ),
                      ),
                    ),*/
                  ),
                ),
              ),
            ),


    );
  }
}
