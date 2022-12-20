import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/domain/entities/reset_password_entity.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/forgot_password_state.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/reset_new_password_controller.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/text_field_widget.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';

import '../../../../router/app_routes.dart';
import '../business_logic/cubit/reset_password_cubit.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(
                height: 131.h,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Consumer(
                      builder: (context, ref, _) => TextFieldWidget(
                          hintText: 'New Password',
                          textInputAction: TextInputAction.next,
                          onChanged: (password) {
                            ref.watch(newPasswordProvider.notifier).state =
                                password;
                          },
                          validator: (passwordValidator) {
                            if (passwordValidator!.length>6) {
                              return null;
                            } else {
                              return 'Password field is required';
                            }
                          }),
                    ),
                    SizedBox(
                      height: 31.h,
                    ),
                    Consumer(
                      builder: (context, ref, _) => TextFieldWidget(
                          hintText: 'Password Confirmation',
                          textInputAction: TextInputAction.done,
                          onChanged: (passwordConfirmation) {
                            ref
                                .watch(newPasswordConfirmationProvider.notifier)
                                .state = passwordConfirmation;
                          },
                          validator: (passwordConfirmationValidator) {
                            if (passwordConfirmationValidator! == ref.watch(newPasswordProvider)) {
                              return null;
                            } else {
                              return 'Passwords do not match!';
                            }
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 49.h,
              ),
              Consumer(builder: (context, ref, _) {
                return BlocConsumer<ResetPasswordCubit,
                    Result<ResetPasswordEntity>>(
                  listener: (context, state) => state.when(() => null,
                      loading: () => null,
                      initial: () => null,
                      error: ((message, code) => QuickAlert.show(
                            context: context,
                            showCancelBtn: true,
                            type: QuickAlertType.error,
                            backgroundColor: AppColors.scaffoldBackgroundColor,
                            cancelBtnText: 'Cancel',
                            cancelBtnTextStyle:
                                AppTextStyle.buttonTextStyle.copyWith(
                              color: Colors.black45,
                            ),
                            confirmBtnText: 'Retry',
                            confirmBtnTextStyle: AppTextStyle.buttonTextStyle
                                .copyWith(color: Colors.black45),
                            text: message,
                            onCancelBtnTap: () => Navigator.of(context).pop(),
                            confirmBtnColor: AppColors.scaffoldBackgroundColor,
                            onConfirmBtnTap: () {
                              Navigator.of(context).pop();
                            },
                          )),
                      success: (success) {
                        final snackBar = SnackBar(
                          backgroundColor: AppColors.primaryColor,
                          content: Text(
                            success.message,
                            style: AppTextStyle.whiteBold.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return Navigator.pushNamedAndRemoveUntil(
                            context, REGISTER, (route) => false);
                      }),
                  builder: (context, state) => state.when(() => Container(),
                      loading: () => const CircularProgressIndicator(),
                      initial: (() => AppButtons(
                            buttonText: 'Confirm',
                            buttonColor: AppColors.primaryColor,
                            onPressed: () {
                             if(_formKey.currentState!.validate()){
                               BlocProvider.of<ResetPasswordCubit>(context)
                                  .sendForgotPasswordEmail(
                                      password: ref.watch(newPasswordProvider),
                                      password_confirmation: ref.watch(
                                          newPasswordConfirmationProvider),
                                      code: ref
                                          .watch(forgotPasswordCodeProvider));
                             }
                            },
                            height: 52.h,
                            width: 327.w,
                            buttonTextStyle: AppTextStyle.buttonTextStyle
                                .copyWith(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                          )),
                      error: (message, code) => AppButtons(
                            buttonText: 'Confirm',
                            buttonColor: AppColors.primaryColor,
                            onPressed: () { BlocProvider.of<ResetPasswordCubit>(context)
                                  .sendForgotPasswordEmail(
                                      password: ref.watch(newPasswordProvider),
                                      password_confirmation: ref.watch(
                                          newPasswordConfirmationProvider),
                                      code: ref
                                          .watch(forgotPasswordCodeProvider));},
                            height: 52.h,
                            width: 327.w,
                            buttonTextStyle: AppTextStyle.buttonTextStyle
                                .copyWith(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                          ),
                      success: (success) => AppButtons(
                            buttonText: 'Confirm',
                            buttonColor: AppColors.primaryColor,
                            onPressed: () { BlocProvider.of<ResetPasswordCubit>(context)
                                  .sendForgotPasswordEmail(
                                      password: ref.watch(newPasswordProvider),
                                      password_confirmation: ref.watch(
                                          newPasswordConfirmationProvider),
                                      code: ref
                                          .watch(forgotPasswordCodeProvider));},
                            height: 52.h,
                            width: 327.w,
                            buttonTextStyle: AppTextStyle.buttonTextStyle
                                .copyWith(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                          )),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
