import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/statecontroller/personal_assistant_profile_state_controller.dart';
import 'package:staff_breeze/style/app_colors.dart';

class AboutMeReviewsSlidingSwitch extends StatelessWidget {
  const AboutMeReviewsSlidingSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,ref,_) {
        return SizedBox(
         // height: 44.h,
        //  width: 343.w,
          child: SlidingSwitch(
              //height: 44.h,
              width: 343.w,
              background: const Color(0xff515A75),
              buttonColor: AppColors.primaryColor,
              animationDuration: const Duration(milliseconds: 100),
              textOn: 'Reviews +',
              textOff: 'About Me',
              colorOff: Colors.white,
              colorOn: Colors.white,
              inactiveColor: const Color(0xffFFFFFF).withOpacity(0.6),
              value: false,
              onChanged: (value) {
                print(value);
                ref.watch(reviewsOrAboutMeProvider.notifier).state=value;
              },
              //iconOn: Icons.add,
              onTap: () {},
              onDoubleTap: () {},
              onSwipe: () {}),
        );
      }
    );
  }
}
