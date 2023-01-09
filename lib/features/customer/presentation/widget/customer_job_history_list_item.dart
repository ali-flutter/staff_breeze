import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/bearer_token_saver.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/user_id_saver.dart';
import 'package:staff_breeze/features/customer/presentation/business_logic/cubit/get_customer_reservation_cubit.dart';
import 'package:staff_breeze/features/customer/presentation/pages/customer_job_history_page.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_images.dart';

import '../../../../style/app_text_style.dart';

class JobHistoryListItem extends StatelessWidget {
  const JobHistoryListItem({Key? key, required this.image, required this.name,required this.dates})
      : super(key: key);
  final String? image;
  final String name;
  final List<String>dates;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: double.infinity,
      decoration: BoxDecoration(
      color: const Color(0xff181928),
      border: Border.symmetric(horizontal: BorderSide(color: Color(0xff352641),width: 1.h))
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 32.w),
        child: Center(
          child: ListTile(

            leading: Container(
              height: 40.w,
              width: 40.w,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
                image: image == null || image!.isEmpty
                    ? const DecorationImage(
                        image: AssetImage(AppImages.placeholderImage),
                        fit: BoxFit.cover)
                    : DecorationImage(
                        image: NetworkImage(image!), fit: BoxFit.cover),
              ),
            ),
            title: Padding(
              padding:  EdgeInsets.only(left: 24.w),
              child: Text(
                "You hired $name",
                style: AppTextStyle.appHintStyle.copyWith(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: Padding(
              padding:  EdgeInsets.only(left: 24.w,top: 10.h),
              child: Container(
                height: 20.h,
                width: 50.w,
                
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics:const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  itemCount: dates.length,

                  itemBuilder: (context,i)=>Text(
                  dates[i],
                  style: AppTextStyle.appHintStyle.copyWith(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ), separatorBuilder: (BuildContext context, int index)=>Text('  '),),
              ),
            )
          ),
        ),
      ),
    );
  }
}
