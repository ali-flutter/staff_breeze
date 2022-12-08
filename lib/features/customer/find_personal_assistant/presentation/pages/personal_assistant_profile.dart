import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';

import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/statecontroller/personal_assistant_profile_state_controller.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/widget/personal_assistant_profile_widget/about_me_and_reviews_list.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/widget/personal_assistant_profile_widget/about_me_widget.dart';
import 'package:staff_breeze/router/app_routes.dart';

import 'package:staff_breeze/style/app_text_style.dart';

import '../../../../../style/app_colors.dart';
import '../../../../../style/app_images.dart';
import '../../../../../style/dimensions_controller.dart';
import '../widget/personal_assistant_profile_widget/aboutme_reviews_sliding_switch.dart';

class PersonalAssistantProfile extends StatefulWidget {
  const PersonalAssistantProfile({Key? key}) : super(key: key);

  @override
  State<PersonalAssistantProfile> createState() =>
      _PersonalAssistantProfileState();
}

class _PersonalAssistantProfileState extends State<PersonalAssistantProfile> {
  bool keyboardState = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
      setState(() {
        keyboardState = true;
      });
      print('keyboardState IS $keyboardState');
    } else {
      setState(() {
        keyboardState = false;
      });
      print(keyboardState);
    }
  }

  List stars = [
    AppImages.star,
    AppImages.star,
    AppImages.star,
    AppImages.coloredStar,
    AppImages.coloredStar,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: !keyboardState
          ? GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, CUSTOMER_PROFILE);
              },
              child: Container(
                height: 82.h,
                width: 82.w,
                decoration: const BoxDecoration(
                  color: AppColors.scaffoldBackgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff6D7EB4).withOpacity(0.65),
                          offset: const Offset(4, 10),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                        child: SizedBox(
                      height: (23.1).h,
                      width: 20.w,
                      child: SvgPicture.asset(
                        AppImages.profileIcon,
                        fit: BoxFit.fill,
                        color: Colors.white,
                      ),
                    )),
                  ),
                ),
              ),
            )
          : null,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 0,
        clipBehavior: Clip.none,
        color: AppColors.scaffoldBackgroundColor,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 30.h,
        ),
      ),
      backgroundColor: Colors.white,
      //AppColors.primaryColor,
      body: Stack(
        children: [
          Column(
            children: [
              Consumer(builder: (context, ref, _) {
                return Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).padding.top *
                          10.4, //320.h, //Sizer.h(context, 0.32),
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              ref.watch(chosenPersonalAssistantImage),
                            ),
                            fit: BoxFit.cover),
                        color: const Color(
                            0xff515A75), //AppColors.primaryColor.withOpacity(0.3),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).padding.top *
                          10.4, //320.h, //Sizer.h(context, 0.32),
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.shadow),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 24.w, right: 21.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            /* SizedBox(
                                height: 56.h,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back),
                                color: Colors.white,
                                iconSize: 26.sp,
                              ),
                              SizedBox(
                                height: 80.h,
                              ),*/
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back),
                              color: Colors.white,
                              iconSize: 26.sp,
                            ),
                            SizedBox(
                              height: Sizer.h(context, 0.14),
                            ),
                            Text(ref.watch(chosenPersonalAssistantName),
                              style: AppTextStyle.whiteBold.copyWith(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            /* SizedBox(
                                height: 7.h,
                              ),*/
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //Stars widget
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: stars
                                      .map(
                                        (singleStar) => Padding(
                                          padding: EdgeInsets.only(right: 9.w),
                                          child: SizedBox(
                                            height: 22.5.h,
                                            width: 16.w,
                                            child: SvgPicture.asset(
                                              singleStar,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                                // hire button Widget
                                Column(
                                  children: [
                                    AppButtons(
                                      buttonText: 'HIRE',
                                      buttonColor: AppColors.primaryColor,
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, PICK_A_DATE);
                                      },
                                      height: 32.h,
                                      width: 114.w,
                                      buttonTextStyle:
                                          AppTextStyle.whiteBold.copyWith(
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xff181928),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff181928),
                        spreadRadius: 6,
                        blurRadius: 90,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizer.w(context, 0.06),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Sizer.h(context, 0.035),
                        ),
                        const AboutMeReviewsSlidingSwitch(),
                        Consumer(builder: (context, ref, _) {
                          return SizedBox(
                              height: !ref.watch(reviewsOrAboutMeProvider)
                                  ? 27.h
                                  : 0.h //Sizer.h(context, 0.039),
                              );
                        }),
                        Flexible(
                          child: Consumer(builder: (context, ref, _) {
                            return ref.watch(reviewsOrAboutMeProvider)
                                ? SizedBox(
                                    height: Sizer.h(context, 0.445),
                                    child: const AboutMeReviewsList(),
                                  )
                                : const AboutMeWidget();
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
