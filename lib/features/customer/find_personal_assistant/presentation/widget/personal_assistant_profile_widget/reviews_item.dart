import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';

class ReviewsItem extends StatelessWidget {
  const ReviewsItem({super.key,required this.height,required this.arrowButtonWidget});
  final double height;
  final Widget arrowButtonWidget;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: height,
      width: 343.w,
      decoration: BoxDecoration(
        color: const Color(0xff515A75), // AppColors.primaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
     
     child: Center(
        child: Column(
          // mainAxisSize: MainAxisSize.max,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             SizedBox(
               height: 32.h,
             ),
          Flexible(
            child:  Padding(
              padding:  EdgeInsets.only(left: Sizer.w(context,0.2)),
              child: ListTile(
                 leading: Container(
                   height: 36.h,
                   width: 36.w,
                   decoration: const BoxDecoration(
                       color: AppColors.primaryColor, shape: BoxShape.circle),
                 ),
                 title: Text(
                   'Personal Assistant',
                   style: AppTextStyle.whiteBold,
                   //overflow: TextOverflow.ellipsis,
                 ),
                 subtitle: Text('1 hour',style: AppTextStyle.regularGrey,),
                trailing: arrowButtonWidget
               ),
            ), ),

        ],),
      ),
     );
  }
}
