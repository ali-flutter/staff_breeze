
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/router/app_routes.dart';

import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_images.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SizedBox(
        width: Sizer.w(context, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height:MediaQuery.of(context).padding.top,
            ),
            SizedBox(height: Sizer.h(context, 0.25),),
            SizedBox(
              height: Sizer.h(context, 0.23),
              width: Sizer.w(context, 0.5),
              child: CircleAvatar(
                backgroundColor: AppColors.mediumPrimary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Sizer.h(context, 0.07),
                    ),
                    SizedBox(
                        height: Sizer.h(context, 0.025),
                        width: Sizer.w(context, 0.19),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Sizer.w(context, 0.025),
                              right: Sizer.w(context, 0.03),
                              //top:Sizer.h(context,0.02)
                          ),
                          child: Image.asset(AppImages.logo),
                        )),
                    SizedBox(
                        width: Sizer.w(context, 0.19),
                        child: Padding(
                          padding:  EdgeInsets.only(
                              left: Sizer.w(context, 0.03),
                              right: Sizer.w(context, 0.03),
                              top:Sizer.h(context,0.01),


                          ),
                          child: Image.asset(AppImages.logo),
                        )),
                    SizedBox(
                        width: Sizer.w(context, 0.19),
                        child: Padding(
                          padding:  EdgeInsets.only(
                            left: Sizer.w(context, 0.03),
                              right: Sizer.w(context, 0.03),
                              top:Sizer.h(context,0.01),

                          ),
                          child: Image.asset(AppImages.logo),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Sizer.h(context, 0.03),
            ),
            SizedBox(child: SvgPicture.asset(AppImages.staff_breeze)),
            SizedBox(
              height: Sizer.h(context, 0.2),
            ),
            AppButtons(
              height:Sizer.h(context, 0.062) ,
              width:Sizer.w(context, 0.5) ,
                buttonText: 'GET STARTED',
                buttonColor: AppColors.mediumPrimary,
                onPressed: () {/*
                print(context.router.current.name);*/
               //  AutoRouter.of(context).pushNamed('welcome');
                Navigator.pushNamed(context,WELCOME_PAGE);
                },)
          ],
        ),
      ),
    );
  }
}
