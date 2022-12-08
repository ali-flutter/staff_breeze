import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/text_field_widget.dart';
import 'package:staff_breeze/router/app_routes.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import '../business_logic/payment_state_controller.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({Key? key}) : super(key: key);


  getStarredText(String cardNumber){
    int cardLength=cardNumber.length;
    final subCard=cardNumber.substring(0,cardLength-4);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff343D58),
      appBar: AppBar(
        backgroundColor: const Color(0xff343D58),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Text(
            'x',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      body: SizedBox(
        width: Sizer.w(context, 1),
        child: SingleChildScrollView(
          // physics:const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                'AMOUNT TO PAY',
                style: AppTextStyle.whiteBold.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    r'$',
                    style: AppTextStyle.whiteBold.copyWith(
                      fontSize: 34.sp,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    '0000',
                    style: AppTextStyle.whiteBold.copyWith(
                      fontSize: 34.sp,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 27.9.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    padding: EdgeInsets.only(left: 24.w),
                    child: Text(
                      'PAY WITH',
                      style: AppTextStyle.whiteBold.copyWith(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w600,
                        // height: .5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    height: 44.81.h,
                    padding: EdgeInsets.only(left: 84.w),
                    width: MediaQuery.of(context).size.width * 1,
                    color: const Color(0xff4A5587),
                    child: Row(
                      children: [
                        Text(
                          'Credit Card  ',
                          style: AppTextStyle.whiteBold.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            height: 2.5,
                          ),
                        ),
                        Consumer(
                          builder: (context,ref,_) {
                            return Text(ref.watch(cardNumberController),
                              style: AppTextStyle.whiteBold.copyWith(

                            fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              height: 2.5,
                              ),
                            );
                          }
                        )
                      ],
                    ),
                  ),
                    /*Container(
                      height: 44.81.h,
                      padding: EdgeInsets.only(left: 84.w),
                      width: MediaQuery.of(context).size.width * 1,
                      color: const Color(0xff4A5587),
                      child: Text(
                        'ONE FINANCE',
                        style: AppTextStyle.whiteBold.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          height: 2.5,
                        ),
                      ),
                    ),*/
                  Container(
                    height: 44.81.h,
                    padding: EdgeInsets.only(left: 84.w),
                    width: MediaQuery.of(context).size.width * 1,
                    color: AppColors.primaryColor,
                    child: Text(
                      'Pay with new credit card',
                      style: AppTextStyle.whiteBold.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        height: 2.5,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26.h,
              ),
              Container(
                height: 327.w,
                width: 327.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.r)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Consumer(
                        builder: (context,ref,_) {
                          return TextFormField(
                            inputFormatters: [
                              CreditCardNumberInputFormatter(
                                useSeparators: true,
                                onCardSystemSelected: (c){

                                }
                              ),
                            ], onChanged: (value){
                            ref.watch(cardNumberController.notifier).state=value;
                          },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Card Number',
                              hintStyle: AppTextStyle.appHintStyle,
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xff707070), width: 1.h),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xff352641), width: 1.h),
                              ),
                            ),
                          );
                        }
                      ),
                      Consumer(
                        builder: (context,ref,_) {
                          return TextFormField(
                            inputFormatters: [
                              CreditCardExpirationDateFormatter(
                              ),
                            ],
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              hintText: 'Expiry Date',
                              suffixText: 'mm/yy',
                              hintStyle: AppTextStyle.appHintStyle,
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xff707070), width: 1.h),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xff352641), width: 1.h),
                              ),
                            ),

                          );
                        }
                      ),
                      TextFormField(
                        inputFormatters: [
                          CreditCardCvcInputFormatter(
                          ),
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'CVV',
                          hintStyle: AppTextStyle.appHintStyle,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xff707070), width: 1.h),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xff352641), width: 1.h),
                          ),
                        ),
                      ),
                      TextFormField(

                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'CardHolder Name',
                          hintStyle: AppTextStyle.appHintStyle,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xff707070), width: 1.h),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xff352641), width: 1.h),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              AppButtons(
                buttonText: 'Add Card',
                buttonColor: AppColors.primaryColor,
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 361.h,
                        width: MediaQuery.of(context).size.width * 1,
                        color: AppColors.scaffoldBackgroundColor,
                        child: Padding(
                          padding: EdgeInsets.only(left: 24.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(
                                height: 39.h,
                              ),
                              SizedBox(
                                width: Sizer.w(context, 1),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 26.w,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'CANCEL',
                                        style: AppTextStyle.appHintStyle
                                            .copyWith(
                                                color: const Color(0xffC1BAC6),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 69.w,
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'REVIEW',
                                        style: AppTextStyle.appHintStyle
                                            .copyWith(
                                                color: AppColors.primaryColor,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                height: 150.h,
                                width: 327.w,
                                decoration: BoxDecoration(
                                    color: const Color(0xffEBEBEB),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 26.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: Sizer.h(context, 0.05),
                                      ),
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            Text(
                                              'AMOUNT',
                                              style: AppTextStyle.appHintStyle
                                                  .copyWith(
                                                color: const Color(0xffA3A1A4),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 75.w,
                                            ),
                                            Text(
                                              r'$0000',
                                              style: TextStyle(
                                                  color: AppColors.primaryColor,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: Sizer.h(context, 0.05),
                                      ),
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            Text(
                                              'CREDIT CARD',
                                              style: AppTextStyle.appHintStyle
                                                  .copyWith(
                                                color: const Color(0xffA3A1A4),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 45.w,
                                            ),
                                            Text(
                                              r'ONE FINANCE ****',
                                              style: TextStyle(
                                                  color: AppColors.primaryColor,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 19.h),
                              AppButtons(
                                buttonText: 'COMPLETE PAYMENT',
                                buttonColor: AppColors.primaryColor,
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      CONTACT_WITH_PERSONAL_ASSISTANT);
                                },
                                height: 52.h,
                                width: 300.w,
                                buttonTextStyle:
                                    AppTextStyle.buttonTextStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                height: 52.h,
                width: 300.w,
                buttonTextStyle: AppTextStyle.buttonTextStyle.copyWith(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//TextFieldWidget(hintText: 'Card Number'),

/* SizedBox(
                        height: 28.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Expiry Date',
                                  style: AppTextStyle.appHintStyle,
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(right: 40.w),
                                  child: Text('hi'),
                                )
                              ],
                            ),
                            Divider(
                              thickness: 0.8.h,
                              height: 3.h,
                              color: Color(0xff707070),
                            )
                          ],
                        ),
                      ),*/

//*TextFieldWidget(hintText: 'Expire Date'),*//*
/*  TextFieldWidget(hintText: 'CVV'),
                      TextFieldWidget(
                        hintText: 'Card Holder Name',
                        textInputAction: TextInputAction.done,
                      ),*/
