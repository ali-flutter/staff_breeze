import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:staff_breeze/core/common_widgets/alert_dialog.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/bearer_token_saver.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/user_id_saver.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/schedule_entity/insert_free_days.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/business_logic/cubit/insert_free_days_cubit.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/widgets/schedule/week_picker_widget.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/text_field_widget.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';
import 'package:status_alert/status_alert.dart';

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

  ScrollController hoursScrollController = ScrollController();
  ScrollController numbersOfWeeksScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    hoursScrollController.dispose();
    numbersOfWeeksScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff343D58),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            setState(() {
              showHoursOpen = false;
              showRepeatNumberOfWeeks = false;
            });
          },
          child: SingleChildScrollView(
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
                  height: MediaQuery.of(context).size.height * 0.75,
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
                                            /* onPressed: () {
                                                ref.watch(weeksProvider.notifier).state = int.parse(ref.watch(scheduleRepeatForNumberOfWeeks) == 'Repeat for number of weeks' ? '0' : ref.watch(scheduleRepeatForNumberOfWeeks));
                                              },*/
                                            /*child: Text(*/
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
                                            /*)*/
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
                                    const Divider(
                                      color: Color(0xff707070),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      width: double.infinity,
                                    ),
                                    SizedBox(
                                      height: 115.h,
                                    ),
                                    Consumer(builder: (context, ref, _) {
                                      return BlocConsumer<InsertFreeDaysCubit, Result<InsertFreeDaysEntity>>(
                                          listener: (context, state) => state.when(
                                              () => null,
                                              loading: () =>null,
                                              initial: () => null,
                                              error: (e, s) =>
                                                  AppDialogs.errorDialog(
                                                      context,
                                                      error:
                                                          'Please, Complete your profile.',
                                                      onConfirmBtnTap: () {
                                                    getUserId().then(
                                                      (id) =>
                                                          bearerTokenRetreiver()
                                                              .then(
                                                        (bearer) => BlocProvider
                                                                .of<InsertFreeDaysCubit>(
                                                                    context)
                                                            .InserFreeDays(
                                                          bearer_token:
                                                              "Bearer $bearer",
                                                          assistant_id: id ?? 0,
                                                          hours: ref.watch(
                                                                  selectedNumberOfHours) ??
                                                              0,
                                                          hourly_rate: int
                                                              .parse(ref.watch(
                                                                  hourlyRateProvider)),
                                                          start_at: 0,
                                                          weeks: ref.watch(
                                                                  selectedNumberOfWeeks) ??
                                                              0,
                                                          free_days: ref.watch(
                                                              selectedFreeDays),
                                                        ),
                                                      ),
                                                    );

                                                    Navigator.pop(context);
                                                  }),
                                              success: (success) {
                                                if(success is InsertFreeDaysEntity && success.code=="403"){
                                                  return StatusAlert.show(context,
                                                      configuration: IconConfiguration(icon:Icons.error_outline),
                                                      title: 'please complete your profile first',
                                                    subtitle: 'Please complete your profile to Insert your free days'
                                                  );
                                                }else{
                                                  return StatusAlert.show(context,
                                                      configuration: IconConfiguration(icon:Icons.done),
                                                      title: 'Success',
                                                      subtitle: 'Your days were Inserted successfully'
                                                  );
                                                }
                                              }
                                                ),
                                          builder: (context, state) {
                                            if (state is Loading) {
                                              return const CircularProgressIndicator();
                                            } else {
                                              return AppButtons(
                                                buttonText: 'SAVE CHANGES',
                                                buttonTextStyle: AppTextStyle
                                                    .buttonTextStyle
                                                    .copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.sp,
                                                ),
                                                buttonColor:
                                                    AppColors.primaryColor,
                                                onPressed: () {
                                                  getUserId().then((id) => bearerTokenRetreiver().then((bearer) => BlocProvider
                                                          .of<InsertFreeDaysCubit>(
                                                              context)
                                                      .InserFreeDays(
                                                          bearer_token:
                                                              "Bearer $bearer",
                                                          assistant_id: id ?? 0,
                                                          hours:
                                                              ref.watch(selectedNumberOfHours) ??
                                                                  0,
                                                          hourly_rate: int.parse(
                                                              ref.watch(hourlyRateProvider)),
                                                          start_at: 0,
                                                          weeks: ref.watch(selectedNumberOfWeeks) ?? 0,
                                                          free_days: ref.watch(selectedFreeDays))));
                                                },
                                                height: 52.h,
                                                width: 280.w,
                                              );
                                            }
                                          });
                                    }),
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
                                              physics: const BouncingScrollPhysics(
                                                  parent:
                                                      AlwaysScrollableScrollPhysics()),
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
                                                            child: TextButton(
                                                                child: Text(
                                                                  e,
                                                                  style: AppTextStyle
                                                                      .appHintStyle
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                    fontSize:
                                                                        14.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  ref
                                                                          .watch(selectedNumberOfWeeks
                                                                              .notifier)
                                                                          .state =
                                                                      int.parse(
                                                                          e);
                                                                  ref
                                                                      .watch(scheduleRepeatForNumberOfWeeks
                                                                          .notifier)
                                                                      .state = e;
                                                                }),
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
                            Consumer(builder: (context, ref, _) {
                              return TextFieldWidget(
                                hintText: 'Payment per hour',
                                keyBoardType: TextInputType.number,
                                onChanged: (v) {
                                  ref.watch(hourlyRateProvider.notifier).state =
                                      v;
                                },
                              );
                            }),
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
                                    Consumer(builder: (context, ref, _) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            ref.watch(selectedAvailabeTimePerDay) ==
                                                    0
                                                ? 'Available times per day'
                                                : '${ref.watch(selectedAvailabeTimePerDay)}',
                                            style: AppTextStyle.appHintStyle
                                                .copyWith(
                                                    color:
                                                        const Color(0xff241332)
                                                            .withOpacity(0.32),
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                      );
                                    }),
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
                                                          child: Consumer(
                                                              builder: (context,
                                                                  ref, _) {
                                                            return TextButton(
                                                              onPressed: () {
                                                                ref
                                                                        .watch(selectedAvailabeTimePerDay
                                                                            .notifier)
                                                                        .state =
                                                                    int.parse(
                                                                        e);
                                                                print(ref.watch(
                                                                    selectedAvailabeTimePerDay));
                                                              },
                                                              child: Text(e,
                                                                  style: AppTextStyle
                                                                      .appHintStyle
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                    fontSize:
                                                                        14.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  )),
                                                            );
                                                          }),
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
