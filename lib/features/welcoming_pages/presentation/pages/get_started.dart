import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/user_id_saver.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/user_role_id_saver.dart';
import 'package:staff_breeze/router/app_routes.dart';

import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_images.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';


class GetStartedPage extends StatefulWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  void initState() {
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff6D7EB4),//Color.fromARGB(109, 126, 108, 1),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SizedBox(
          width: Sizer.w(context, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              SizedBox(
                height: Sizer.h(context, 0.25),
              ),
              SizedBox(
                height: (154.08).w, //Sizer.h(context, 0.23),
                width: (154.08.w),
                child: CircleAvatar(
                    backgroundColor: AppColors.mediumPrimary,
                    child: SizedBox(
                        height: (52.81).h, //Sizer.h(context, 0.23),
                        width: (37.25).w,
                        child: SvgPicture.asset(AppImages.getStarted))),
              ),
              SizedBox(
                height: Sizer.h(context, 0.03),
              ),
              SizedBox(child: SvgPicture.asset(AppImages.staff_breeze)),
              SizedBox(
                height: Sizer.h(context, 0.2),
              ),
              AppButtons(
                height: Sizer.h(context, 0.062),
                width: Sizer.w(context, 0.5),
                buttonText: 'GET STARTED',
                buttonColor: AppColors.mediumPrimary,
                onPressed: () {
                  Navigator.pushNamed(context, WELCOME_PAGE);
                },
              ),
              SizedBox(
                height: 12.h,
              )
            ],
          ),
        ),
      ),
    );
  }

 
}
