import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/text_field_widget.dart';
import 'package:staff_breeze/router/app_routes.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_images.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:url_launcher/url_launcher.dart';
class ContactPersonalAssistant extends StatelessWidget {
   ContactPersonalAssistant({Key? key}) : super(key: key);
  final Uri phoneNumber=Uri.parse('tel:+963-930-835-960');
  final Uri whatsApp=Uri.parse('https://wa.me/tel:+963-930-835-960');
//final uri= phoneNumber+whatsApp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          color:const Color(0xff757575),
          icon:const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 56.w),
              child: Text(
                'CONTACT',
                style: AppTextStyle.blackBold.copyWith(
                  fontSize: 26.sp,
                ),
              ),
            ),
            SizedBox(
              height: 38.h,
            ),
            Container(
              height:662.h,
              width: MediaQuery.of(context).size.width * 1,
              color:const Color(0xff343D58),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                     SizedBox(height: 32.h,),
                     Container(
                       height:  52.h,
                       width: 343.w,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(50),
                         color: AppColors.primaryColor,
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           TextButton(
                               onPressed: (){},
                               child: Text( '       EMAIL   ',style: AppTextStyle.buttonTextStyle.copyWith(
                                 color: Colors.white,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 13.sp,
                               ),),),
                            SvgPicture.asset(AppImages.divide),
                           TextButton(
                             onPressed: ()async{
                               await canLaunchUrl(phoneNumber);
                                await launchUrl(whatsApp);
                             //  launchUrl
                               // print(canLunchUrl());
                              //openWhatsApp()  ;
                             },
                             child: Text('WHATSAPP',style: AppTextStyle.buttonTextStyle.copyWith(
                               color: Colors.white,
                               fontWeight: FontWeight.bold,
                               fontSize: 13.sp,
                             ),),),
                         ],
                       ),
                     ),
                  SizedBox(height: 45.h,),
                  Text('QUICK CONTACT',style: AppTextStyle.appHintStyle.copyWith(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),),
                  SizedBox(height: 24.h,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Container(
                    height: 367.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.r),
                      color: Colors.white,
                    ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 25.w),
                        child: Column(
                          children: [SizedBox(
                            height: 33.h,
                          ),
                           TextFieldWidget(hintText: 'Name'),
                            SizedBox(height: 25 .h,),
                            TextFieldWidget(hintText: 'Email'),
                            SizedBox(height: 25.h,),
                            TextFieldWidget(hintText: 'Message'),
                            SizedBox(height: 10.h,),
                            TextFieldWidget(hintText: ''),
                            SizedBox(height: 10.h,),
                            TextFieldWidget(hintText: ''),
                            SizedBox(height: 10.h,),
                            TextFieldWidget(hintText: '')


                          ],
                        ),
                      ),
                  ),
                  ), SizedBox(height: 25.h,),
                  AppButtons(buttonText: 'SEND',
                      buttonTextStyle: AppTextStyle.buttonTextStyle.copyWith(
                        color: Colors.white
                      ),
                      buttonColor: AppColors.primaryColor,
                      onPressed:() {

                        Navigator.of(context)
                            .pushNamedAndRemoveUntil(FIND_PERSONAL_ASSISTANT, (Route<dynamic> route) => false);
                      },

                      height: 52.h, width:300.w)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
