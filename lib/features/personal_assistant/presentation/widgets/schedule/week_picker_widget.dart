import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:intl/intl.dart';
import '../../business_logic/controller/schedule_state_controller.dart';

class WeekPickerWidget extends StatefulWidget {
  WeekPickerWidget({Key? key}) : super(key: key);

  @override
  State<WeekPickerWidget> createState() => _WeekPickerWidgetState();
}

class _WeekPickerWidgetState extends State<WeekPickerWidget> {
  List<bool> selection = List.generate(7*4, (index) =>false);

  @override
  void initState() {
    getTheNameOfTheNextSevenDay();
    super.initState();
  }

    final formatter = DateFormat('EEEE');
  List getTheNameOfTheNextSevenDay() {
    List<DateTime> days = List.generate(
      7 * 4, // 4weeks
      (index) =>
        DateTime.now().add(Duration(days: index + 1)),

    );

    return days;
  }

  /*int today=DateTime.now().day;


     final date=DateTime(DateTime.now().year,DateTime.now().month,today);
     final formattedDate=DateFormat("EEEE").format(date);
     print( formattedDate);
   */

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return SizedBox(
        height: 27.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: getTheNameOfTheNextSevenDay().length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  if (selection[i]) {
                    ref.watch(selectedFreeDays.notifier).state.remove(DateFormat("yyyy-MM-dd").format(getTheNameOfTheNextSevenDay()[i]));
                    print(ref.watch(selectedFreeDays));
                    setState(() {
                      selection[i] = false;
                    });
                  } else if (!selection[i]) {

                    ref.watch(selectedFreeDays.notifier).state.add(DateFormat("yyyy-MM-dd").format(getTheNameOfTheNextSevenDay()[i]));
                    print(ref.watch(selectedFreeDays));
                    setState(() {
                      selection[i] = true;
                    });
                  }
                },
                child: Container(
                  height: 27.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: selection[i]
                          ? const Color(0xff4159A2)
                          : AppColors.scaffoldBackgroundColor,
                      shape: BoxShape.circle),
                  child: Center(
                    child: Text(
                     formatter.format(getTheNameOfTheNextSevenDay()[i]).toString().substring(0,3).toUpperCase()
                     /* getTheNameOfTheNextSevenDay()[i].toString().substring(0,3).toUpperCase()*/,
                      style: AppTextStyle.appHintStyle.copyWith(
                          color: selection[i]
                              ? Colors.white
                              : const Color(0xff5F6998),
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              );
            }),
      );
    });
  }
}


