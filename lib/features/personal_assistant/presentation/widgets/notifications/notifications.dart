import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/widgets/notifications/hire_notification.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';

import '../../business_logic/controller/notification_state_controller.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff707070),
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Notifications',
                style: AppTextStyle.blackBold.copyWith(
                  fontSize: 26.sp,
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              Consumer(builder: (context, ref, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButtons(
                        buttonText: 'Hire',
                        buttonTextStyle: ref.watch(isHireButtonTapped)
                            ? AppTextStyle.buttonTextStyle.copyWith(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              )
                            : AppTextStyle.buttonTextStyle.copyWith(
                                color: const Color(0xff998FA2).withOpacity(0.6),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                        buttonColor: ref.watch(isHireButtonTapped)
                            ? AppColors.primaryColor
                            : AppColors.scaffoldBackgroundColor,
                        onPressed: () {
                          ref.watch(isHireButtonTapped.notifier).state = true;
                        },
                        height: 32.h,
                        width: 81.w),
                    AppButtons(
                      buttonText: 'Review',
                      buttonTextStyle: ref.watch(isHireButtonTapped) == false
                          ? AppTextStyle.buttonTextStyle.copyWith(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            )
                          : AppTextStyle.buttonTextStyle.copyWith(
                              color: const Color(0xff998FA2).withOpacity(0.6),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                      buttonColor: ref.watch(isHireButtonTapped)
                          ? AppColors.scaffoldBackgroundColor
                          : AppColors.primaryColor,
                      onPressed: () {
                        ref.watch(isHireButtonTapped.notifier).state = false;
                      },
                      height: 32.h,
                      width: 81.w,
                    ),
                  ],
                );
              }),
              SizedBox(
                height: 12.h,
              ),
              const Flexible(
                child: HireNotifications(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
