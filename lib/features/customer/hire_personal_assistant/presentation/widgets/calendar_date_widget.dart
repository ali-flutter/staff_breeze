import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:staff_breeze/style/app_theme.dart';

class CalendarDateWidget extends StatelessWidget {
   CalendarDateWidget(
      {Key? key, required this.firstDate, required this.lastDate,required this.initialValues,
       required this.onValueChanged,
        required this.selectableDayPredicate
      })
      : super(key: key);
  final void Function(List<DateTime?>)? onValueChanged;
  final DateTime firstDate;
  final DateTime lastDate;
  final List<DateTime?> initialValues;
   bool Function(DateTime)? selectableDayPredicate;
 final  List datesss=[DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day),
   DateTime(DateTime.now().year,DateTime.now().month,22),
   DateTime(DateTime.now().year,DateTime.now().month,12),
   DateTime(DateTime.now().year,DateTime.now().month,23),

 ];
  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker2(
      onDisplayedMonthChanged: null,

  onValueChanged: onValueChanged ,
      config: CalendarDatePicker2Config(
      selectableDayPredicate: selectableDayPredicate,
        firstDate: firstDate,
        lastDate:lastDate,
        //weekdayLabels: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'],
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
