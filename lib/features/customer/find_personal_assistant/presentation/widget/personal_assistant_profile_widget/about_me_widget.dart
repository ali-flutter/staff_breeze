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
    return Container(
      height: 325.h,
      width: 343.w,
      decoration: BoxDecoration(
        color: const Color(0xff515A75),
        borderRadius: BorderRadius.circular(50),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizer.w(context, 0.066), vertical: Sizer.h(context, 0.02)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Me',
                style: AppTextStyle.whiteBold.copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),
              Consumer(builder: (context, ref, _) {
                return Text(
                  ref.watch(chosenPersonalAssistantAboutProvider) ?? 'No About Me!',
                  style: AppTextStyle.ironExtraBig.copyWith(color: Color.fromARGB(255, 210, 206, 213), fontSize: 14.sp, fontWeight: FontWeight.w500, height: 1.3),
                );
              }),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 5.h),
                child: Divider(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  SectionTitle(title: 'Address'),
                  SizedBox(
                    width: 6.w,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      return SizedBox(
                        // height: 50.h,
                        width: 200.w,
                        child: Text(
                          ref.watch(chosenPersonalAssistantCountry)!.first.title ?? 'No Address!', //TODO add city
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.appHintStyle.copyWith(color: Color.fromARGB(255, 210, 206, 213), fontSize: 12.5.sp, fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  SectionTitle(title: 'Gender'), //TODO add gender
                  SizedBox(
                    width: 6.w,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      return SizedBox(
                        // height: 50.h,
                        width: 200.w,
                        child: Text(
                          ref.watch(chosenPersonalAssistantCountry)!.first.title ?? 'No Address!', //TODO add city
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.appHintStyle.copyWith(color: Color.fromARGB(255, 210, 206, 213), fontSize: 12.5.sp, fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  SectionTitle(title: 'Education'),
                  SizedBox(
                    width: 6.w,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      return SizedBox(
                        // height: 50.h,
                        width: 190.w,
                        child: Text(
                          ref.watch(chosenPersonalAssistantEducation)!.isNotEmpty ? ref.watch(chosenPersonalAssistantEducation)!.first.title : 'No Educations!',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.appHintStyle.copyWith(color: Color.fromARGB(255, 210, 206, 213), fontSize: 12.5.sp, fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  SectionTitle(title: 'Languages'),
                  SizedBox(
                    width: 6.w,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      return SizedBox(
                        // height: 50.h,
                          width: 180.w,
                          child: SizedBox(
                            height: 40.h,
                            width: 90.w,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 13.h),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: ref.watch(chosenPersonalAssistantLanguagesList)!.length,
                                itemBuilder: (context, i) => Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                                  child: Text(
                                    ref.watch(chosenPersonalAssistantLanguagesList)![i].title.toString(),
                                    style:
                                    AppTextStyle.appHintStyle.copyWith(color: Color.fromARGB(255, 210, 206, 213), fontSize: 12.5.sp, fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ),
                            ),
                          )
                        //  Text(
                        //   ref.watch(chosenPersonalAssistantLanguagesList)!.isNotEmpty ? ref.watch(chosenPersonalAssistantLanguagesList)!.first.title : 'No Languages!',
                        //   maxLines: 2,
                        //   overflow: TextOverflow.ellipsis,
                        //   style: AppTextStyle.appHintStyle.copyWith(color: Color.fromARGB(255, 210, 206, 213), fontSize: 12.5.sp, fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),
                        // ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r), color: Colors.white.withOpacity(.1)),
      child: Text(
        title,
        style: AppTextStyle.ironExtraBig.copyWith(
          color: Colors.white,
          fontSize: 12.5.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
