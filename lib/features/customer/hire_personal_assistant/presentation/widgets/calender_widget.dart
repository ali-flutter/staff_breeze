import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:staff_breeze/style/app_theme.dart';

import '../../../../../style/app_colors.dart';
class SecondCalendarDateWidget extends StatelessWidget {
  const SecondCalendarDateWidget(
      {Key? key, required this.firstDate, required this.lastDate,required this.initialValues,
      required this.onValueChanged,
      })
      : super(key: key);
  final DateTime firstDate;
  final DateTime lastDate;
  final List<DateTime?> initialValues;
  final void Function(List<DateTime?>)? onValueChanged;
  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker2(
      onDisplayedMonthChanged: null,
      onValueChanged:onValueChanged ,
      config: CalendarDatePicker2Config(
        selectedDayHighlightColor:AppColors.primaryColor.withOpacity(.91),
        firstDate: firstDate,
        lastDate: lastDate,
        weekdayLabels: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'],
        weekdayLabelTextStyle: AppTextStyle.appHintStyle.copyWith(
            color: const Color(0xffFFFFFF).withOpacity(0.50),
            fontSize: 11.sp,
            fontWeight: FontWeight.w500),

        //yearTextStyle: TextStyle(color: Colors.amber),
        controlsHeight: 0,
        nextMonthIcon: const SizedBox(),
        lastMonthIcon: const SizedBox(),
        calendarViewMode: DatePickerMode.day,
        dayTextStyle: AppTextStyle.whiteBold.copyWith(
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
        selectedDayTextStyle: AppTextStyle.whiteBold.copyWith(
          fontSize: 13.sp,
        ),
        calendarType: CalendarDatePicker2Type.multi,
        controlsTextStyle: AppTextStyle.whiteBold.copyWith(
          color: const Color(0xff343D58),
        ),
      ),
      initialValue:initialValues,
    );
  }
}
