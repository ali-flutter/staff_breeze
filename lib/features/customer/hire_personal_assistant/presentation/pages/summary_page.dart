import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/router/app_routes.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';
import '../../../../../style/app_colors.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 56.w,
                ),
                Text(
                  'SUMMARY',
                  style: AppTextStyle.blackBold,
                ),
              ],
            ),
            SizedBox(
              height: 43.h,
            ),
            Container(
              height: Sizer.h(context, 0.2),
              color: const Color(0xff343D58),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'TOTAL BALANCE',
                      style: AppTextStyle.whiteBold.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          r'$',
                          style: AppTextStyle.whiteBold.copyWith(fontSize: 34.sp),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          '0000',
                          style: AppTextStyle.whiteBold.copyWith(fontSize: 34.sp),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 41.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 56.w,
                ),
                Text(
                  'REVIEW TRANSACTION',
                  style: AppTextStyle.mediumGrey.copyWith(
                      color: const Color(0xff998FA2).withOpacity(0.56),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 23.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 56.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Booked from MON to SAT',
                    style: AppTextStyle.mediumGrey.copyWith(
                      color: const Color(0xff998FA2),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      height: 2.5,
                    ),
                  ),
                  Text(
                    'Working hour from: 6:35 AM - 8:22 PM',
                    style: AppTextStyle.mediumGrey.copyWith(
                      color: const Color(0xff998FA2),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      height: 2.5,
                    ),
                  ),
                  Text(
                    r'Your total balance $00000',
                    style: AppTextStyle.mediumGrey.copyWith(
                      color: const Color(0xff998FA2),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      height: 2.5,
                    ),
                  ),
                  Text(
                    '+Plus APP fee.',
                    style: AppTextStyle.mediumGrey.copyWith(
                      color: const Color(0xff998FA2),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      height: 2.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 24.w,
                ),
                AppButtons(
                  buttonText: 'MAKE A TRANSFER',
                  buttonColor: AppColors.primaryColor,
                  onPressed: () {
                   Navigator.pushNamed(context,PAYMENT_PAGE);
                    // AutoRouter.of(context).push(PaymentRoute());
                    },
                  buttonTextStyle: AppTextStyle.buttonTextStyle.copyWith(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600),
                  height: 52.h,
                  width: 300.w,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
