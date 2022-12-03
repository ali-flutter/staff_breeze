import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/widgets/schedule/week_picker_widget.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/text_field_widget.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';

import '../../business_logic/controller/schedule_state_controller.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final List<String> hours = const ["1", "2", "3", "4", "5", "6", "7", "8"];
  final List<String> numberOfWeeksRepeat = const ["1", "2", "3", "4"];
  bool showHoursOpen = false;
  bool showRepeatNumberOfWeeks = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff343D58),
      body: SafeArea(
        child:  GestureDetector(
            onTap: () {
              setState(() {
                showHoursOpen = false;
                showRepeatNumberOfWeeks = false;
              });
            },
            child:SingleChildScrollView(
              child: Column(
                  children: [
                    Container(
                      height: Sizer.h(context, 0.2),
                      width: Sizer.w(context, 1),
                      color: const Color(0xff343D58),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Sizer.h(context, 0.1),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 56.w,
                              ),
                              Text(
                                'Schedule',
                                style: AppTextStyle.whiteBold.copyWith(
                                  fontSize: 26.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.75,
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 390.h,
                                ),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Consumer(builder: (context, ref, _) {
                                              return Text(
                                                ref.watch(
                                                    scheduleRepeatForNumberOfWeeks),
                                                style: AppTextStyle.appHintStyle
                                                    .copyWith(
                                                        color:
                                                            const Color(0xff241332)
                                                                .withOpacity(0.32),
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              );
                                            }),
                                            IconButton(
                                              onPressed: () {
                                                if (showRepeatNumberOfWeeks) {
                                                  setState(() {
                                                    showRepeatNumberOfWeeks = false;
                                                  });
                                                } else {
                                                  setState(() {
                                                    showRepeatNumberOfWeeks = true;
                                                  });
                                                }
                                              },
                                              icon: const Icon(
                                                  Icons.arrow_drop_down_sharp),
                                              color: const Color(0xff998FA2),
                                            )
                                          ],
                                        ),
                                        /*  SizedBox(
                                          height: 8.h,
                                        ),*/
                                        const Divider(
                                          color: Color(0xff707070),
                                        ),
                                      ],
                                    ),Column(
                                      children: [
                                        const SizedBox(
                                          width: double.infinity,
                                        ),
                                        SizedBox(
                                          height: 115.h,
                                        ),
                                        AppButtons(
                                          buttonText: 'SAVE CHANGES',
                                          buttonTextStyle:
                                          AppTextStyle.buttonTextStyle.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                          ),
                                          buttonColor: AppColors.primaryColor,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          height: 52.h,
                                          width: 280.w,
                                        ),
                                      ],
                                    ),
                                    showRepeatNumberOfWeeks
                                        ? Container(
                                            padding: EdgeInsets.only(
                                                left: 257.w, top: 30.h),
                                            child: Container(
                                              height: 121.h,
                                              width: 49.w,
                                              decoration: BoxDecoration(
                                                  color: AppColors
                                                      .scaffoldBackgroundColor,
                                                  border: Border.all(
                                                      color:
                                                          const Color(0xffD4D4D4))),
                                              child: Center(
                                                child: ListView(
                                                  children: numberOfWeeksRepeat
                                                      .map(
                                                        (e) => Center(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 6.h),
                                                            child: Consumer(builder:
                                                                (context, ref, _) {
                                                              return GestureDetector(
                                                                onTap: () {
                                                                  ref
                                                                      .watch(scheduleRepeatForNumberOfWeeks
                                                                          .notifier)
                                                                      .state = e;
                                                                  setState(() {
                                                                    showRepeatNumberOfWeeks =
                                                                        false;
                                                                  });
                                                                },
                                                                child: Text(e,
                                                                    style: AppTextStyle.appHintStyle.copyWith(
                                                                        color: AppColors
                                                                            .primaryColor,
                                                                        fontSize:
                                                                            14.sp,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold)),
                                                              );
                                                            }),
                                                          ),
                                                        ),
                                                      )
                                                      .toList(),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container()
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 300.h,
                                ),
                                const TextFieldWidget(hintText: 'Payment per hour'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 93.h,
                                ),
                                Text(
                                  'Select your available days',
                                  style: AppTextStyle.appHintStyle.copyWith(
                                    color:
                                        const Color(0xff241332).withOpacity(0.32),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                const Divider(
                                  color: Color(0xff707070),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                WeekPickerWidget(),
                                SizedBox(
                                  height: 34.h,
                                ),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Available times per day',
                                              style: AppTextStyle.appHintStyle
                                                  .copyWith(
                                                      color: const Color(0xff241332)
                                                          .withOpacity(0.32),
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.w500),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                if (showHoursOpen) {
                                                  setState(() {
                                                    showHoursOpen = false;
                                                  });
                                                } else {
                                                  setState(() {
                                                    showHoursOpen = true;
                                                  });
                                                }
                                              },
                                              icon: const Icon(
                                                  Icons.arrow_drop_down_sharp),
                                              color: const Color(0xff998FA2),
                                            )
                                          ],
                                        ),
                                        const Divider(
                                          color: Color(0xff707070),
                                        ),
                                      ],
                                    ),
                                    showHoursOpen
                                        ? Container(
                                            padding: EdgeInsets.only(
                                                left: 257.w, top: 30.h),
                                            child: Container(
                                              height: 121.h,
                                              //  width: 59.w,
                                              decoration: BoxDecoration(
                                                  color: AppColors
                                                      .scaffoldBackgroundColor,
                                                  border: Border.all(
                                                      color:
                                                          const Color(0xffD4D4D4))),
                                              child: Center(
                                                child: ListView(
                                                  children: hours
                                                      .map((e) => Center(
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          6.h),
                                                              child: Text(
                                                                e,
                                                                style: AppTextStyle
                                                                    .appHintStyle
                                                                    .copyWith(
                                                                  color: AppColors
                                                                      .primaryColor,
                                                                  fontSize: 14.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ))
                                                      .toList(),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ],
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
