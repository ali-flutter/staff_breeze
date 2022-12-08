import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/pages/find_personal_assistant_page.dart';
import 'package:staff_breeze/features/registration/domain/entities/sign_up_entity.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/sign_up_state_controller.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/validators.dart';
import 'package:staff_breeze/features/registration/presentation/cubit/sign_up_cubit.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/shaker.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/text_field_widget.dart';
import 'package:staff_breeze/injection_container/injection.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';
import '../../../../core/network_configration/result.dart';
import '../../../../router/app_routes.dart';
import '../../domain/entities/sign_in_entity.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  late GlobalKey<FormState> formKey;
  late GlobalKey<ShakeWidgetState> firstNameShaker;
  late GlobalKey<ShakeWidgetState> lastNameShaker;
  late GlobalKey<ShakeWidgetState> userNameShaker;
  late GlobalKey<ShakeWidgetState> emailShaker;
  late GlobalKey<ShakeWidgetState> passwordShaker;
  late GlobalKey<ShakeWidgetState> confirmPasswordShaker;

  @override
  void initState() {
    super.initState();
    firstNameShaker = GlobalKey<ShakeWidgetState>();
    lastNameShaker = GlobalKey<ShakeWidgetState>();
    formKey = GlobalKey<FormState>();
    userNameShaker = GlobalKey<ShakeWidgetState>();
    emailShaker = GlobalKey<ShakeWidgetState>();
    passwordShaker = GlobalKey<ShakeWidgetState>();
    confirmPasswordShaker = GlobalKey<ShakeWidgetState>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizer.w(context, 0.05)),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, _) => ShakeWidget(
                key: firstNameShaker,
                shakeOffset: 10,
                child: TextFieldWidget(
                  hintText: 'First name',
                  validator: (firstNameValidator) {
                    if (firstNameValidator != '') {
                      return null;
                    } else {
                      firstNameShaker.currentState!.animationController
                          .forward();
                      return 'First name field is required';
                    }
                  },
                  onChanged: (firstName) => ref
                      .watch(signUpFirstNameProvider.notifier)
                      .state = firstName,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Consumer(
              builder: (context, ref, _) => ShakeWidget(
                key: lastNameShaker,
                shakeOffset: 10,
                child: TextFieldWidget(
                  hintText: 'Last name',
                  validator: (last) {
                    if (last! != '') {
                      return null;
                    } else {
                      lastNameShaker.currentState!.animationController
                          .forward();
                      //lastNameKey.currentState!.animationController.forward();
                      return 'Last name field is required.';
                    }
                  },
                  onChanged: (lastName) => ref
                      .watch(signUpLastNameProvider.notifier)
                      .state = lastName,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Consumer(
              builder: (context, ref, _) => ShakeWidget(
                key: userNameShaker,
                shakeOffset: 10,
                child: TextFieldWidget(
                  hintText: 'User name',
                  validator: (userNameValue) {
                    if (userNameValue != '') {
                      return null;
                    } else {
                      userNameShaker.currentState!.animationController
                          .forward();
                      return 'User name field is required';
                    }
                  },
                  onChanged: (userName) => ref
                      .watch(signUpUserNameProvider.notifier)
                      .state = userName,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Consumer(
              builder: (context, ref, _) => ShakeWidget(
                key: emailShaker,
                shakeOffset: 10,
                child: TextFieldWidget(
                  hintText: 'Email',
                  validator: (emailValue) {
                    if (emailValue!.trim().isValidEmail) {
                      return null;
                    } else {
                      emailShaker.currentState!.animationController.forward();
                      return 'Please, enter a valid email.';
                    }
                  },
                  onChanged: (email) =>
                      ref.watch(signUpEmailProvider.notifier).state = email,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Consumer(
              builder: (context, ref, _) => ShakeWidget(
                key: passwordShaker,
                shakeOffset: 10,
                child: TextFieldWidget(
                  hintText: 'Password',
                  validator: (passwordValue) {
                    print(passwordValue);
                    if (passwordValue == '') {
                      passwordShaker.currentState!.animationController
                          .forward();
                      return 'Password field is required';
                    } else if (passwordValue!.length < 6) {
                      print('i go here');
                      passwordShaker.currentState!.animationController
                          .forward();
                      return 'Password field should contain at least 6 characters';
                    } else {}
                  },
                  onChanged: (password) => ref
                      .watch(signUpPasswordProvider.notifier)
                      .state = password,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Consumer(
              builder: (context, ref, _) => ShakeWidget(
                key: confirmPasswordShaker,
                shakeOffset: 10,
                child: TextFieldWidget(
                  textInputAction: TextInputAction.done,
                  hintText: 'Confirm password',
                  validator: (confirmPasswordValue) {
                    if (confirmPasswordValue ==
                        ref.watch(signUpPasswordProvider)) {
                      return null;
                    } else {
                      confirmPasswordShaker.currentState!.animationController
                          .forward();
                      return 'Passwords do not match';
                    }
                  },
                  onChanged: (passwordConfirmation) => ref
                      .watch(signUpConfirmPasswordProvider.notifier)
                      .state = passwordConfirmation,
                ),
              ),
            ),
            SizedBox(height: 57.h),
            Consumer(builder: (context, ref, _) {
              return BlocConsumer<SignUpCubit, Result<SignUpEntity>>(
                listener: (context, state) {
                  state.when(() => null,
                      loading: () => null,
                      initial: () => null,
                      error: (error, s) => QuickAlert.show(
                          context: context,
                          showCancelBtn: true,
                          type: QuickAlertType.error,
                          backgroundColor: AppColors.scaffoldBackgroundColor,
                          cancelBtnText: 'Cancel',
                          cancelBtnTextStyle: AppTextStyle.buttonTextStyle
                              .copyWith(color: Colors.black45),
                          onCancelBtnTap: () => Navigator.of(context).pop(),
                          confirmBtnText: 'Retry',
                          confirmBtnTextStyle: AppTextStyle.buttonTextStyle
                              .copyWith(color: Colors.black45),
                          text: error,
                          confirmBtnColor: AppColors.scaffoldBackgroundColor,
                          onConfirmBtnTap: () =>
                              BlocProvider.of<SignUpCubit>(context).signUp(
                                  name: '${ref.watch(signUpFirstNameProvider)}' +
                                      ' ${ref.watch(signUpLastNameProvider)}',
                                  email: ref.watch(signUpEmailProvider),
                                  password: ref.watch(signUpPasswordProvider),
                                  password_confirmation:
                                      ref.watch(signUpConfirmPasswordProvider),
                                  accountTypeId:
                                      ref.watch(signUpAccountTypeIdProvider))),
                      success: (response) {
                        if (ref.watch(signUpAccountTypeIdProvider) == 0) {
                          Navigator.pushReplacementNamed(
                              context, FIND_PERSONAL_ASSISTANT);
                        } else if (ref.watch(signUpAccountTypeIdProvider) ==
                            1) {
                          Navigator.pushReplacementNamed(
                              context, PERSONAL_ASSISTANT_HOMEPAGE);
                        }
                      });
                },
                builder: (context, state) => state.when(
                  () => const SizedBox(),
                  loading: () => const CircularProgressIndicator(),
                  initial: () => Consumer(
                      builder: (context, ref, _) => AppButtons(
                            buttonText: 'CONTINUE',
                            buttonColor: AppColors.primaryColor,
                            height: 52.h,
                            width: 327.w,
                            buttonTextStyle: AppTextStyle.buttonTextStyle
                                .copyWith(color: Colors.white),
                            onPressed: () {
                              if (FocusScope.of(context).hasPrimaryFocus) {
                                FocusScope.of(context).unfocus();
                              }
                              if (formKey.currentState!.validate()) {
                                if (ref.watch(signUpAccountTypeIdProvider) ==
                                    0) {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      FIND_PERSONAL_ASSISTANT,
                                      (route) => false);
                                } else if (ref
                                        .watch(signUpAccountTypeIdProvider) ==
                                    1) {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      COMPLETE_REGISTRATION, (route) => false);
                                }
                                /* BlocProvider.of<SignUpCubit>(context).signUp(
                                  name: '${ref.watch(signUpFirstNameProvider)}'+' ${ref.watch(signUpLastNameProvider)}',
                                  email: ref.watch(signUpEmailProvider),
                                  password: ref.watch(signUpPasswordProvider),
                                   password_confirmation: ref.watch(signUpConfirmPasswordProvider),
                                   accountTypeId:ref.watch(signUpAccountTypeIdProvider)
                              );*/
                              } else {}
                            },
                          )),
                  error: (error, s) => AppButtons(
                    buttonText: 'CONTINUE',
                    buttonColor: AppColors.primaryColor,
                    height: 52.h,
                    width: 327.w,
                    buttonTextStyle: AppTextStyle.buttonTextStyle
                        .copyWith(color: Colors.white),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<SignUpCubit>(context).signUp(
                            name: '${ref.watch(signUpFirstNameProvider)}' +
                                ' ${ref.watch(signUpLastNameProvider)}',
                            email: ref.watch(signUpEmailProvider),
                            password: ref.watch(signUpPasswordProvider),
                            password_confirmation:
                                ref.watch(signUpConfirmPasswordProvider),
                            accountTypeId:
                                ref.watch(signUpAccountTypeIdProvider));
                      } else {}
                    },
                  ),
                  success: (data) {
                    return AppButtons(
                      buttonText: 'CONTINUE',
                      buttonColor: AppColors.primaryColor,
                      height: 52.h,
                      width: 327.w,
                      buttonTextStyle: AppTextStyle.buttonTextStyle
                          .copyWith(color: Colors.white),
                      onPressed: () {
                        if (FocusScope.of(context).hasPrimaryFocus) {
                          FocusScope.of(context).unfocus();
                        }
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<SignUpCubit>(context).signUp(
                              name: '${ref.watch(signUpFirstNameProvider)}' +
                                  ' ${ref.watch(signUpLastNameProvider)}',
                              email: ref.watch(signUpEmailProvider),
                              password: ref.watch(signUpPasswordProvider),
                              password_confirmation:
                                  ref.watch(signUpConfirmPasswordProvider),
                              accountTypeId:
                                  ref.watch(signUpAccountTypeIdProvider));
                        } else {}
                      },
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
