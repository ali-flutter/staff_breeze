import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staff_breeze/core/common_widgets/alert_dialog.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/bearer_token_saver.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/domain/entities/remove_device_token_entity.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/cubit/remove_device_token_cubit.dart';
import 'package:staff_breeze/router/app_routes.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_images.dart';
import 'package:staff_breeze/style/app_text_style.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key, required this.profileImage, required this.name})
      : super(key: key);
  final String name;
  final String profileImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 734.h,
      width: 334.w,
      decoration: const BoxDecoration(
          color: Color(0xff181928),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(90),
            bottomRight: Radius.circular(50),
          )),
      child: SizedBox(
        width: 334.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 40.w),
              child:

                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 36.h,
                      ),
                      Container(height:94.w ,
                      width: 94.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          image: profileImage==''?DecorationImage(
                            image: AssetImage(AppImages.placeholderImage),
                            fit: BoxFit.cover,
                          ):DecorationImage(image: NetworkImage(imagesUrl+profileImage),
                            fit: BoxFit.cover,),
                        ),
                      ),
                      /*SizedBox(
                        height: 64.w,
                        width: 64.w,
                        child: Image.asset(
                          AppImages.drawer_png,
                          fit: BoxFit.fill,
                        ),
                      ),*/
                  /*    SizedBox(
                        height: 12.h,
                      ),*/
                      Text(
                        '$name',
                        style: AppTextStyle.whiteBold.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Text(
                        '$name',
                        style: AppTextStyle.appHintStyle.copyWith(
                            color: Color(0xff707070),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      )
                    ],


              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 21.w),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: Image.asset(AppImages.house_icon),
                        ),
                        SizedBox(
                          width: (18.9).w,
                        ),
                        Text(
                          'Profile',
                          style: AppTextStyle.whiteBold.copyWith(
                              fontSize: 16.sp, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(SCHEDULE);
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: Image.asset(AppImages.calen_icon),
                        ),
                        SizedBox(
                          width: (18.9).w,
                        ),
                        Text(
                          'Schedule',
                          style: AppTextStyle.whiteBold.copyWith(
                              fontSize: 16.sp, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, NOTIFICATIONS);
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: Image.asset(AppImages.noti_icon),
                        ),
                        SizedBox(
                          width: (18.9).w,
                        ),
                        Text(
                          'Notification',
                          style: AppTextStyle.whiteBold.copyWith(
                              fontSize: 16.sp, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, JOB_HISTORY);
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: Image.asset(AppImages.hand_money),
                        ),
                        SizedBox(
                          width: (18.9).w,
                        ),
                        Text(
                          'Job History',
                          style: AppTextStyle.whiteBold.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, CONTACT_SUPPORT);
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: Image.asset(AppImages.user_icon),
                        ),
                        SizedBox(
                          width: (18.9).w,
                        ),
                        Text(
                          'Contact support',
                          style: AppTextStyle.whiteBold.copyWith(
                              fontSize: 16.sp, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 150.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                         // Navigator.pushNamed(context, NEW_PASSWORD);
                        },
                        child: Text(
                          'Change Password',
                          style: AppTextStyle.appHintStyle.copyWith(
                              color: const Color(0xffFFFFFF).withOpacity(0.56),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      BlocConsumer<RemoveDeviceTokenCubit,
                          Result<RemoveDeviceTokenEntity>>(
                        listener: (context, state) => state.when(() => null,
                            initial: () => null,
                            loading: () => QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.loading,
                                  confirmBtnText: '',
                                  cancelBtnText: '',
                                  backgroundColor: AppColors.primaryColor,
                                ),
                            error: (e, s) => AppDialogs.errorDialog(context,
                                    error: e ?? 'Something went wrong',
                                    onConfirmBtnTap: () {
                                  bearerTokenRetreiver().then((value) =>
                                      BlocProvider.of<RemoveDeviceTokenCubit>(
                                              context)
                                          .removeDeviceToken(
                                              bearer_token: "Bearer $value"));
                                }),
                            success: (response) async{
                             SharedPreferences prefs=await SharedPreferences.getInstance();
                             prefs.remove("UserRoleId");
                             prefs.remove("deviceToken");
                             prefs.remove("bearerToken");
                             prefs.remove("UserId").then((value) =>  Navigator.pushNamedAndRemoveUntil(
                                 context, GET_STARTED, (route) => false));
                              return ;
                            }),
                        builder: (context, state) {
                          return TextButton(
                            onPressed: () {
                              bearerTokenRetreiver().then((value) =>
                                  BlocProvider.of<RemoveDeviceTokenCubit>(
                                          context)
                                      .removeDeviceToken(
                                          bearer_token: "Bearer $value")).then((value) =>
                                  Navigator.pushNamedAndRemoveUntil(context,WELCOME_PAGE, (route) => false));
                            },
                            child: Text(
                              'Log out',
                              style: AppTextStyle.appHintStyle.copyWith(
                                  color:
                                      const Color(0xffFFFFFF).withOpacity(0.56),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
