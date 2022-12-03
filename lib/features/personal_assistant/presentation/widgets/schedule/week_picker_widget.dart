import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';

import '../../business_logic/controller/schedule_state_controller.dart';

class WeekPickerWidget extends StatefulWidget {
   WeekPickerWidget({Key? key}) : super(key: key);

  @override
  State<WeekPickerWidget> createState() => _WeekPickerWidgetState();
}

class _WeekPickerWidgetState extends State<WeekPickerWidget> {
  final  List<String>weekDays=const ['MON','TUE','WED','THU','FRI','SAT','SUN'];

  List<bool> selection=[false,false,false,false,false,false,false];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,ref,_) {
        return Container(
          height:27.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: weekDays.length,
              itemBuilder: (context,i){
            return GestureDetector(
              onTap: (){
                 if(selection[i]){
                   setState(() {
                     selection[i]=false;
                   });
                 }else if(!selection[i]){
                   setState(() {
                     selection[i]=true;
                   });
                 }

              },
              child: Container(
                height: 27.h,
                width: 40.w,
                decoration: BoxDecoration(
                  color: selection[i]?Color(0xff4159A2):AppColors.scaffoldBackgroundColor,
                  shape: BoxShape.circle
                ),
                child: Center(
                  child: Text(
                    weekDays[i], style:AppTextStyle.appHintStyle.copyWith(
                      color:selection[i]?Colors.white :Color(0xff5F6998),
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w500
                  ) ,
                  ),
                ),
              ),
            );
          })
        );
      }
    );
  }
}

/*
* Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: weekDays.map((day) => Text(day,
          style:AppTextStyle.appHintStyle.copyWith(
            color: Color(0xff5F6998),
            fontSize: 9.sp,
            fontWeight: FontWeight.w500
          ) ,
        )).toList(),
      ),*/