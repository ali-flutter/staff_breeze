import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/statecontroller/personal_assistant_profile_state_controller.dart';

import '../../../../../../style/app_text_style.dart';
import '../../../../../../style/dimensions_controller.dart';
class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 249.h,
      width: 343.w,
      decoration: BoxDecoration(
        color: const Color(0xff515A75),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Sizer.w(context, 0.08),
            vertical: Sizer.h(context, 0.03)),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              'About Me',
              style: AppTextStyle.whiteBold
                  .copyWith(
                  fontSize: 16.sp,
                  fontWeight:
                  FontWeight.bold),
            ),
            SizedBox(
              height: 20.h,
            ),
            Consumer(
              builder: (context,ref,_) {
                return Text(
                  ref.watch(chosenPersonalAssistantAboutProvider)??'Not Provided'
                 /*  '''When I was 5 years old, my mother always told me that happiness was the key to life. When I went to school, they asked me what I wanted to be when I grew up. 

Adress: London /ddljjslfhjljsd
Language: English - Spanish''' */,style: AppTextStyle.regularGrey.copyWith(
                    color:const Color(0xffFFFFFF).withOpacity(0.64),
                    fontWeight:FontWeight.w500
                ),);
              }
            )
          ],
        ),
      ),
    );
  }
}
