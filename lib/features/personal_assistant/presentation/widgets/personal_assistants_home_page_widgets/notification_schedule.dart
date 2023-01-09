import"package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../router/app_routes.dart';
import '../../../../../style/app_images.dart';
import '../../../../../style/app_text_style.dart';
import '../../business_logic/controller/personal_assistant_home_page_state_controller.dart';
class NotificationSchedule extends StatelessWidget {
  const NotificationSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer( 
      builder: (context, ref, _) {
                      return Container(
                        height:ref.watch(notificationScheduleHeight),
                        decoration:const BoxDecoration(
                          color:  Color(0xff423050),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60))
                        ),
                        child: Container(
                            margin:  EdgeInsetsDirectional.only(start: (0.5).w, end: 0, bottom: (1.5).h),
                          decoration:const BoxDecoration(
                            color: Color(0xff181928),
                             borderRadius: BorderRadius.only(bottomLeft:Radius.circular(60)),
                          
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 75.w,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, SCHEDULE);
                                  }, //schedule
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 31.h,
                                        width: 31.w,
                                        child: SvgPicture.asset(
                                          AppImages.calendar,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        'Schedule',
                                        style: AppTextStyle.appHintStyle.copyWith(color: const Color(0xff998FA2), fontSize: 12.sp, fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 56.w,
                                ),
                                //vertical divider
                                Container(
                                  height: 69.h,
                                  width: 0.3.w,
                                  color: const Color(0xff817889),
                                ),
                                SizedBox(
                                  width: 56.w,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, NOTIFICATIONS);
                                  },
                                  // Notification
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 31.h,
                                        width: 31.w,
                                        child: SvgPicture.asset(
                                          AppImages.personalBell,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        'Notification',
                                        style: AppTextStyle.appHintStyle.copyWith(color: const Color(0xff998FA2), fontSize: 12.sp, fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
  }
}