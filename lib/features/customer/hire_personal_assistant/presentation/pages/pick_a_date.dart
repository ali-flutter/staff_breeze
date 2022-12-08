import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staff_breeze/core/common_widgets/bottom_bar.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/presentation/widgets/calendar_date_widget.dart';
import 'package:staff_breeze/router/app_routes.dart';

import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../style/app_images.dart';
import '../../../../../style/dimensions_controller.dart';
import '../widgets/calender_widget.dart';

class PickDatePage extends StatefulWidget {
  const PickDatePage({Key? key}) : super(key: key);

  @override
  State<PickDatePage> createState() => _PickDatePageState();
}

class _PickDatePageState extends State<PickDatePage> {
  List<String> months = [
    'JANUARY',
    'February',
    'March',
    'April',
    'May',
    'june',
    'july',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  int currentMonthNumber = DateTime.now().month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, SUMMARY_PAGE);
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
                  child: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 0,
        color: AppColors.scaffoldBackgroundColor,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 30.h,
        ),
      ),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff757575),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 6.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 56.w,
                  ),
                  Text(
                    'PICK A DATE',
                    style: AppTextStyle.blackBold,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Flexible(
                child: Container(
                    color: const Color(0xff343D58),
                    child: ListView(
                      physics:const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      children: [
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 56.w),
                          child: Text(
                            months[currentMonthNumber - 1],
                            style: AppTextStyle.whiteBold
                                .copyWith(fontSize: 26.sp),
                          ),
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        CalendarDateWidget(
                          firstDate: DateTime(
                              DateTime.now().year, DateTime.now().month, 1),
                          lastDate: DateTime(
                              DateTime.now().year, DateTime.now().month, 30),
                        ),
                        Divider(
                          color:const Color(0xffFFFFFF).withOpacity(0.1),
                          thickness: 1.h,
                        ),

                        ///START OF THE SECOND CALENDER WIDGET {THE NEXT MONTH}`

                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 56.w),
                          child: Text(
                            currentMonthNumber == 12
                                ? 'January'
                                : months[currentMonthNumber],
                            style: AppTextStyle.whiteBold
                                .copyWith(fontSize: 26.sp),
                          ),
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        CalendarDateWidget(
                          firstDate: DateTime(
                              DateTime.now().year,
                              DateTime.now().month == 12
                                  ? 1
                                  : DateTime.now().month +
                                      1 /*DateTime.now().month+1*/,
                              1),
                          lastDate: DateTime(
                              DateTime.now().year,
                              DateTime.now().month == 12
                                  ? 1
                                  : DateTime.now().month + 1,
                              30),
                        ),
                        Divider(
                          color: Color(0xffFFFFFF).withOpacity(0.1),
                          thickness: 1.h,
                        ),
                      ],
                    ) //const SizedBox(),//CalendarWidget(),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
