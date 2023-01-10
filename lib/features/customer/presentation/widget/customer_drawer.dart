import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/user_id_saver.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/sign_in_state_controller.dart';
import 'package:staff_breeze/features/welcoming_pages/presentation/business_logic/register_simple_statie_controller/register_controller.dart';

import '../../../../core/common_widgets/alert_dialog.dart';
import '../../../../core/helpers/shared_prefs_manager/bearer_token_saver.dart';
import '../../../../core/network_configration/base_network_config.dart';
import '../../../../core/network_configration/result.dart';
import '../../../../router/app_routes.dart';
import '../../../../style/app_colors.dart';
import '../../../../style/app_images.dart';
import '../../../../style/app_text_style.dart';
import '../../../registration/domain/entities/remove_device_token_entity.dart';
import '../../../registration/presentation/business_logic/cubit/remove_device_token_cubit.dart';
import '../../../welcoming_pages/presentation/widget/app_logo.dart';
import '../../domain/entities/get_customer_entity.dart';
import '../../find_personal_assistant/presentation/business_logic/get_customer_info_cubit.dart';

class CustomerDrawer extends ConsumerStatefulWidget {
  const CustomerDrawer({
    Key? key,
  }) : super(key: key);

  @override
  CustomerDrawerState createState() => CustomerDrawerState();
}

class CustomerDrawerState extends ConsumerState<CustomerDrawer> {
  @override
  void initState() {
    super.initState();

    getUserId().then((value) => value != null
        ? BlocProvider.of<GetCustomerInfoCubit>(context)
            .getCustomerInfo(user_id: value ?? 0)
        : null);
  }

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
                child: ref.watch(isGuestProvider)
                    ? SizedBox(height: 20.h)
                    : BlocBuilder<GetCustomerInfoCubit,
                        Result<GetCustomerInfoEntity>>(
                        builder: (context, state) => state.when(
                          () => Container(),
                          initial: () => Container(),
                          loading: () => SizedBox(
                            height: 210.w,
                            width: 200.w,
                            child: const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.white),
                            ),
                          ),
                          error: (e, s) => Text(
                            e ?? "Something went wrong",
                            style: AppTextStyle.whiteBold.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                          success: (response) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 46.h,
                              ),
                              response.data.profileImage == '' ||
                                      response.data.profileImage == null
                                  ? Padding(
                                      padding: EdgeInsets.only(left: 50.w),
                                      child: Container(
                                        height: 114.w,
                                        width: 114.w,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(32),
                                                bottomRight:
                                                    Radius.circular(32)),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  AppImages.placeholderImage),
                                              fit: BoxFit.cover,
                                            )),
                                        /*child: Image.asset(
                                    AppImages.placeholderImage,
                                    fit: BoxFit.fill,
                                  ),*/
                                      ),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(left: 50.w),
                                      child: Container(
                                        height: 114.w,
                                        width: 114.w,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(32),
                                              bottomRight: Radius.circular(32)),
                                          image: DecorationImage(
                                            image: NetworkImage(imagesUrl +
                                                response.data.profileImage),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 60.w),
                                child: Text(
                                  response.data.name,
                                  style: AppTextStyle.whiteBold.copyWith(
                                    fontSize: 24.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 70.w),
                                child: Text(
                                '',
                                  style: AppTextStyle.appHintStyle.copyWith(
                                      color: const Color(0xff707070),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
            SizedBox(
              height: 32.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: ref.watch(isGuestProvider)?0:21.w),
              child: Column(
                children: [
                  ref.watch(isGuestProvider)?
                      SizedBox(height: 40.h,)
                  :Container(),
                  ref.watch(isGuestProvider)
                      ?SizedBox(
                    height: 140.w,
                    width: 140.w,
                    child:AppLogo(),
                  )
                      :Container(),
                  ref.watch(isGuestProvider)
                      ? SizedBox()
                      : GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, CUSTOMER_PROFILE);
                            // Navigator.pop(context);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
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
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                  SizedBox(height:30.h,
                  ),
                  ref.watch(isGuestProvider)
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            ref.watch(isGuestProvider)
                                ? AppDialogs.warningDialog(context,
                                    warning: "Please, register first",
                                    onConfirmBtnTapped: () =>
                                        Navigator.pushNamed(context, REGISTER))
                                : Navigator.pushNamed(
                                    context, CUSTOMER_JOB_HISTORY_PAGE);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
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
                              ),
                            ],
                          ),
                        ),
                  SizedBox(
                    height: 30.h,
                  ),
                  !ref.watch(isGuestProvider)
                      ?GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, CONTACT_SUPPORT);
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(left:ref.watch(isGuestProvider)?21.w:0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
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
                  ):Container(),
                  SizedBox(
                    height: ref.watch(isGuestProvider)?50.h:230.h,
                  ),
                  ref.watch(isGuestProvider)
                      ? Container()
                      : Row(
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
                                    color: const Color(0xffFFFFFF)
                                        .withOpacity(0.56),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                ref.watch(isGuestProvider)?
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, CONTACT_SUPPORT);
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(left:ref.watch(isGuestProvider)?21.w:0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: 24.h,
                            width: 24.w,
                            child: Image.asset(AppImages.user_icon),
                          ),
                          SizedBox(
                            width: (34).w,
                          ),
                          Text(
                            'Contact support',
                              style: AppTextStyle.appHintStyle.copyWith(
                                  color:
                                  const Color(0xffFFFFFF).withOpacity(0.56),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400)
                          )
                        ],
                      ),
                    ),
                  ):Container(),
                  ref.watch(isGuestProvider)?
                      SizedBox(height: 20.h,):SizedBox(),
                  ref.watch(isGuestProvider)
                      ? Padding(
                    padding: EdgeInsets.only(left:21.w),
                        child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 24.h,
                              width: 24.w,
                              child: Image.asset(AppImages.user_icon),
                            ),
                            SizedBox(width: 25.w,),
                            TextButton(
                                onPressed: () {
                                  ref.watch(isSignUp.notifier).state=true;
                                  Navigator.pushNamed(context, REGISTER);
                                },
                                child: Text(
                                  'Create Account',
                                  style: AppTextStyle.appHintStyle.copyWith(
                                      color:
                                          const Color(0xffFFFFFF).withOpacity(0.56),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                          ],
                        ),
                      )
                      : Container(),
                  ref.watch(isGuestProvider)
                      ?SizedBox(height: 20.h,)
                      :Container(),
                  ref.watch(isGuestProvider)
                      ? Padding(

                    padding:  EdgeInsets.only(left: 21.w),
                        child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 24.h,
                              width: 24.w,
                              child: Image.asset(AppImages.user_icon),
                            ),SizedBox(width: 25.w,),
                            TextButton(
                                child: Text(
                                  'Sign in',
                                  style: AppTextStyle.appHintStyle.copyWith(
                                      color:
                                          const Color(0xffFFFFFF).withOpacity(0.56),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                onPressed: () {
                                  ref.watch(isSignUp.notifier).state=false;
                                  Navigator.pushNamed(context,REGISTER);
                                },
                              ),
                          ],
                        ),
                      )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            BlocConsumer<RemoveDeviceTokenCubit,
                                Result<RemoveDeviceTokenEntity>>(
                              listener: (context, state) => state.when(
                                  () => null,
                                  initial: () => null,
                                  loading: () => QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.loading,
                                        confirmBtnText: '',
                                        cancelBtnText: '',
                                        backgroundColor: AppColors.primaryColor,
                                      ),
                                  error: (e, s) => AppDialogs.errorDialog(
                                          context,
                                          error: e ?? 'Something went wrong',
                                          onConfirmBtnTap: () {
                                        bearerTokenRetreiver().then((value) =>
                                            BlocProvider.of<
                                                        RemoveDeviceTokenCubit>(
                                                    context)
                                                .removeDeviceToken(
                                                    bearer_token:
                                                        "Bearer $value")).then((value) => Navigator.pushNamedAndRemoveUntil(context, GET_STARTED, (route) => false));
                                      }),
                                  success: (response) async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.remove("customerName");
                                    prefs.remove("UserRoleId");
                                    prefs.remove("bearerToken");
                                    prefs.remove('deviceToken');
                                    prefs.remove("UserId").then((value) =>
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            GET_STARTED,
                                            (route) => false));
                                    return;
                                  }),
                              builder: (context, state) {
                                return TextButton(
                                  onPressed: () {
                                    ref.watch(isGuestProvider)
                                        ? Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            GET_STARTED,
                                            (route) => false)
                                        : bearerTokenRetreiver().then((value) =>
                                            BlocProvider.of<RemoveDeviceTokenCubit>(
                                                    context)
                                                .removeDeviceToken(
                                                    bearer_token:
                                                        "Bearer $value"));
                                  },
                                  child: Text(
                                    'Log out',
                                    style: AppTextStyle.appHintStyle.copyWith(
                                        color: const Color(0xffFFFFFF)
                                            .withOpacity(0.56),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
      /*  )
      ),*/
    );
  }
}
