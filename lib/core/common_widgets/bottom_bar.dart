import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/app_colors.dart';
import '../../style/dimensions_controller.dart';

class BottomBarWidgedt extends StatelessWidget {
  const BottomBarWidgedt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        Stack(
          children: [

            Container(
              color: Colors.transparent,
                height: (108.16).h,
              width: Sizer.w(context, 1),
              ),
            SizedBox(
              height: (108.16).h,
              width: Sizer.w(context,1),
              child: Column(
                children: [
                  Container(
                    height: 82.h,
                    width: 82.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.scaffoldBackgroundColor,
                    ),
                    child: Center(
                      child: Container(
                        height: 60.h, //Sizer.h(context, 0.6),
                        width: 60.w, //Sizer.w(context, 0.2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor,
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0xff6D7EB4)
                                    .withOpacity(0.65),
                                offset: const Offset(4, 10),
                                blurRadius: 20,
                                //blurStyle: BlurStyle.outer,
                                spreadRadius: 2)
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.person_outline,
                            size: 35.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                 // / SizedBox(height: 10.h,)
                ],
              ),
            )
          ],
        );


  }
}
