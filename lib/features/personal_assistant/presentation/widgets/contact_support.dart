import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/core/common_widgets/alert_dialog.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/core/common_widgets/button_with_loading.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/pages/personal_assistant_home_page.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/contact_support_field.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/text_field_widget.dart';
import 'package:staff_breeze/router/app_routes.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';


class ContactSupportPage extends StatefulWidget {
  const ContactSupportPage({Key? key}) : super(key: key);

  @override
  State<ContactSupportPage> createState() => _ContactSupportPageState();
}

class _ContactSupportPageState extends State<ContactSupportPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F0F2),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 269.h,
                    width: 375.w,
                    color:AppColors.primaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 72.h,
                        ),
                        Text(
                          'Contact Support',
                          style: AppTextStyle.whiteBold.copyWith(
                            color: Colors.white,
                            fontSize: 26.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Color(0xffF1F0F2),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          height: 367.h,
                        ),
                        ButtonWithLoading(
                          loading: status == 'loading' ? true : false,
                          buttonText: 'SEND',
                          buttonColor: AppColors.primaryColor,
                          onPressed: () async {
                            //Navigator.pop(context);
                            print('ok');
                            dynamic status = await send();
                            if (status == '200') {
                              return AppDialogs.success(context, warning: 'Your Email Has Been Sent', onConfirmBtnTapped: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  PERSONAL_ASSISTANT_HOMEPAGE,
                                      (route) => false,
                                );
                              });
                            }
                            //TODO
                          },
                          height: 52.h,
                          width: 307.w,
                          buttonTextStyle: AppTextStyle.buttonTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ), /*Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width*1,
                          color:  Color(0xffF1F0F2),
                        )*/
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 140.h,
                    ),
                    Container(
                      height: 448.h,
                      width: 327.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 66.h,
                            ),
                            TextFieldWidgetContact(
                              hintText: 'Name',
                              controller: nameController,
                            ),
                            SizedBox(
                              height: 42.h,
                            ),
                            TextFieldWidgetContact(
                              hintText: 'Email',
                              controller: emailController,
                            ),
                            SizedBox(
                              height: 44.h,
                            ),
                            TextFieldWidgetContact(
                              hintText: 'Message',
                              controller: messageController,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final Dio _dio = Dio();
  String status = 'success';

  bool validateInputs() {
    return messageController.text.isNotEmpty && emailController.text.isNotEmpty && nameController.text.isNotEmpty;
  }

  Future send() async {
    if (!validateInputs()) {
      AppDialogs.errorDialog(context, error: 'Please enter all fields', onConfirmBtnTap: () {
        print('ok');
      });
      return;
    }
    // CustomerModel? user;
    setState(() {
      status = 'loading';
    });
    try {
      Response response = await _dio.post(
        'https://staffbreeze.aratech.co/api/contact-support',
        data: {
          'name': nameController.text,
          'email': emailController.text,
          'message': messageController.text,
        },
      );
      print('response: ${response.data}');
      setState(() {
        status = 'done';
      });
      var x = response.data['code'];
      print(x.toString());
      if (x == '200')
        return '200';
      else
        return AppDialogs.warningDialog(context, warning: 'Please fill all fields and recheck if the email is valid!', onConfirmBtnTapped: () {
          Navigator.pop(context);
        });
      //   print(customerModel.name);
    } on DioError catch (e) {
      setState(() {
        status = 'error';
      });
      // if (e.error is SocketException) {
      //   return AppDialogs.errorDialog(context, error: 'An error happened', onConfirmBtnTap: () {
      //     print('ok');
      //   });
      // }
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
        return AppDialogs.errorDialogWithOutConfirmButton(
          context,
          error: 'An error happened',
        );
      }
    }
  }
}
