import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/quickalert.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/domain/entities/forgot_password_entity.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/forgot_password_state.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/validators.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/cubit/forgot_password_cubit.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/shaker.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/text_field_widget.dart';

import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';

import '../../../../injection_container/injection.dart';
import '../../../../router/app_routes.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late GlobalKey<FormState> emailKey;
  late GlobalKey<ShakeWidgetState> shakeEmail;
  @override
  void initState() {
    super.initState();
    emailKey = GlobalKey<FormState>();
    shakeEmail = GlobalKey<ShakeWidgetState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: Sizer.w(context, 1),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: emailKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  Text(
                    "Enter your email to reset code",
                    style: AppTextStyle.appHintStyle.copyWith(
                      color: const Color(0xff241332).withOpacity(0.32),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  ShakeWidget(
                    shakeOffset: 10,
                    key: shakeEmail,
                    child: Consumer(builder: (context, ref, _) {
                      return TextFieldWidget(
                        hintText: 'Email',
                        textInputAction: TextInputAction.done,
                        onChanged: (emailValue) {
                          ref
                              .watch(forgotPasswordEmailProvider.notifier)
                              .state = emailValue;
                          print(ref.watch(forgotPasswordEmailProvider));
                        },
                        validator: (value) {
                          if (value!.isValidEmail) {
                            return null;
                          } else {
                            shakeEmail.currentState!.animationController
                                .forward();
                            return 'Email field is required';
                          }
                        },
                      );
                    }),
                  ),
                  SizedBox(height: 36.h),
                  Consumer(builder: (context, ref, _) {
                    return BlocConsumer<ForgotPasswordCubit,
                        Result<ForgotPasswordEntity>>(
                      listener: (context, state) => state.when(() => null,
                          loading: () => null,
                          initial: () => null,
                          error: ((message, code) => QuickAlert.show(
                                context: context,
                                showCancelBtn: true,
                                type: QuickAlertType.error,
                                backgroundColor:
                                    AppColors.scaffoldBackgroundColor,
                                cancelBtnText: 'Cancel',
                                cancelBtnTextStyle:
                                    AppTextStyle.buttonTextStyle.copyWith(
                                  color: Colors.black45,
                                ),
                                confirmBtnText: 'Retry',
                                confirmBtnTextStyle: AppTextStyle
                                    .buttonTextStyle
                                    .copyWith(color: Colors.black45),
                                text: message,
                                onCancelBtnTap: () =>
                                    Navigator.of(context).pop(),
                                confirmBtnColor:
                                    AppColors.scaffoldBackgroundColor,
                                onConfirmBtnTap: () {
                                  Navigator.of(context).pop();
                                  BlocProvider.of<ForgotPasswordCubit>(context)
                                      .sendForgotPasswordEmail(
                                          email: ref.watch(
                                              forgotPasswordEmailProvider));
                                },
                              )),
                          success: (data) {
                            final snackBar = SnackBar(
                              backgroundColor: AppColors.primaryColor,
                              content: Text(
                                data.message,
                                style: AppTextStyle.whiteBold
                                    .copyWith(fontSize: 18.sp,
                                    fontWeight: FontWeight.w500
                                    ),
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            return Navigator.pushNamed(context, ENTER_CODE);
                          }),
                      builder: (context, state) => state.when(
                        () => Container(),
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        initial: () => AppButtons(
                          buttonText: 'CONTINUE',
                          buttonColor: AppColors.primaryColor,
                          onPressed: () {
                            if (emailKey.currentState!.validate()) {
                              BlocProvider.of<ForgotPasswordCubit>(context)
                                  .sendForgotPasswordEmail(
                                      email: ref
                                          .watch(forgotPasswordEmailProvider));

                              // Navigator.pushNamed(context, ENTER_CODE);
                              // AutoRouter.of(context).push(EnterCodeRoute());
                            } else {}
                          },
                          height: 52.h,
                          width: 327.w,
                          buttonTextStyle: AppTextStyle.buttonTextStyle
                              .copyWith(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600),
                        ),
                        error: (message, code) => AppButtons(
                            buttonText: 'CONTINUE',
                            buttonColor: AppColors.primaryColor,
                            onPressed: () {
                              if (emailKey.currentState!.validate()) {
                                BlocProvider.of<ForgotPasswordCubit>(context)
                                    .sendForgotPasswordEmail(
                                        email: ref.watch(
                                            forgotPasswordEmailProvider));

                                // Navigator.pushNamed(context, ENTER_CODE);
                                // AutoRouter.of(context).push(EnterCodeRoute());
                              } else {}
                            },
                            height: 52.h,
                            width: 327.w,
                            buttonTextStyle: AppTextStyle.buttonTextStyle
                                .copyWith(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                          ),
                        success: (data) {
                          return AppButtons(
                            buttonText: 'CONTINUE',
                            buttonColor: AppColors.primaryColor,
                            onPressed: () {
                              if (emailKey.currentState!.validate()) {
                                BlocProvider.of<ForgotPasswordCubit>(context)
                                    .sendForgotPasswordEmail(
                                        email: ref.watch(
                                            forgotPasswordEmailProvider));

                                // Navigator.pushNamed(context, ENTER_CODE);
                                // AutoRouter.of(context).push(EnterCodeRoute());
                              } else {}
                            },
                            height: 52.h,
                            width: 327.w,
                            buttonTextStyle: AppTextStyle.buttonTextStyle
                                .copyWith(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                          );
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
