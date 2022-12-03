import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_images.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';

import '../../../../registration/presentation/business_logic/controller/sign_up_state_controller.dart';

class CustomerInfoBar extends StatelessWidget {
  const CustomerInfoBar({super.key,required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 45.w,
           width:45.w,
          decoration: const BoxDecoration(
            borderRadius:  BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
            //color:Colors.amber,// AppColors.scaffoldBackgroundColor,
           // TODO : HERE I WANT TO ADD THE REAL IMAGE OF THE CUSTOMER

            image: DecorationImage(
              image:AssetImage(AppImages.avatarImage),
            fit: BoxFit.fill
            ),
          ),
        ),
        //SizedBox(width: 7.5.w),
        Consumer(
          builder: (context,ref,_) {
            //TODO HERE I WANT TO DISPLAY THE FIRST NAME OF THE CUSTOMER
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome ${ref.watch(signUpFirstNameProvider)},',
                style: AppTextStyle.mediumGrey,
                ),
                SizedBox(height:Sizer.h(context, 0.002) ,),
                Text('Search for personal assistant',style:AppTextStyle.blackMedium ,),
              ],
            );
          }
        ),
      // SizedBox(width: Sizer.w(context,0.006),),
        //TODO HERE I WANT TO ADD THE BILL IMAGE FUNCTIONALITY
        // TODO IMAGE OF A BILL WITH A NOTIFICATION AND WITHOUT
       GestureDetector(
         onTap:onPressed,
       child: SizedBox(
         height: 33.w,
       width: 33.w,
         child: SvgPicture.asset(AppImages.drawerIcon),
       ),
       )
      ],
    );
  }
}
