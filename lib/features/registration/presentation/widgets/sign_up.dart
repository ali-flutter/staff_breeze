// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:staff_breeze/core/common_widgets/alert_dialog.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/bearer_token_saver.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/device_token.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/user_id_saver.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/user_role_id_saver.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/pages/find_personal_assistant_page.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/business_logic/controller/personal_assistant_home_page_state_controller.dart';
import 'package:staff_breeze/features/registration/domain/entities/add_device_token_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/sign_up_entity.dart';
import 'package:staff_breeze/features/registration/domain/use_cases/add_device_token_use_case.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/sign_in_state_controller.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/sign_up_state_controller.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/validators.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/cubit/add_device_token_cubit.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/cubit/sign_up_cubit.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/shaker.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/text_field_widget.dart';
import 'package:staff_breeze/injection_container/injection.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';
import '../../../../core/helpers/shared_prefs_manager/customer_data.dart';
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

  // late GlobalKey<ShakeWidgetState> userNameShaker;
  late GlobalKey<ShakeWidgetState> emailShaker;
  late GlobalKey<ShakeWidgetState> passwordShaker;
  late GlobalKey<ShakeWidgetState> confirmPasswordShaker;
  late String deviceToken;

  @override
  void initState() {
    super.initState();
    firstNameShaker = GlobalKey<ShakeWidgetState>();
    lastNameShaker = GlobalKey<ShakeWidgetState>();
    formKey = GlobalKey<FormState>();
    // userNameShaker = GlobalKey<ShakeWidgetState>();
    emailShaker = GlobalKey<ShakeWidgetState>();
    passwordShaker = GlobalKey<ShakeWidgetState>();
    confirmPasswordShaker = GlobalKey<ShakeWidgetState>();
    deviceTokenRetriever().then((value) => deviceToken = value ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizer.w(context, 0.05)),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            ///first name field
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
            SizedBox(height: 20.h),

            ///last name field
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
            SizedBox(height: 20.h),

            ///email field
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
            SizedBox(height: 20.h),

            /// password field
            Consumer(
              builder: (context, ref, _) => ShakeWidget(
                key: passwordShaker,
                shakeOffset: 10,
                child: TextFieldWidget(
                  hintText: 'Password',
                  textInputAction: TextInputAction.next,
                  obscureText: ref.watch(signUpObscurePasswordProvider),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.remove_red_eye),
                    onPressed: () {
                      ref.watch(signUpObscurePasswordProvider.notifier).state =
                          !ref.watch(signUpObscurePasswordProvider);
                    },
                  ),
                  validator: (passwordValue) {
                    if (passwordValue == '') {
                      passwordShaker.currentState!.animationController
                          .forward();
                      return 'Password field is required';
                    } else if (passwordValue!.length < 6) {
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
            SizedBox(height: 20.h),

            ///confirm password field
            Consumer(
              builder: (context, ref, _) => ShakeWidget(
                key: confirmPasswordShaker,
                shakeOffset: 10,
                child: TextFieldWidget(
                  textInputAction: TextInputAction.done,
                  hintText: 'Confirm password',
                  obscureText:
                      ref.watch(signUpObscurePasswordConfirmationProvider),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.remove_red_eye),
                    onPressed: () {
                      ref
                              .watch(signUpObscurePasswordConfirmationProvider
                                  .notifier)
                              .state =
                          !ref.watch(signUpObscurePasswordConfirmationProvider);
                    },
                  ),
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
                      error: (error, s) => AppDialogs.errorDialog(context,
                              error: error ?? 'Something went wrong',
                              onConfirmBtnTap: () {
                            BlocProvider.of<SignUpCubit>(context).signUp(
                                name: '${ref.watch(signUpFirstNameProvider)}'
                                    ' ${ref.watch(signUpLastNameProvider)}',
                                email: ref.watch(signUpEmailProvider),
                                password: ref.watch(signUpPasswordProvider),
                                password_confirmation:
                                    ref.watch(signUpConfirmPasswordProvider),
                                role_id:
                                    ref.watch(signUpAccountTypeIdProvider));
                            Navigator.pop(context);
                          }),
                      success: (response) {
                        if (response is SignUpEntity &&
                            response.code == "422") {
                          AppDialogs.errorDialog(context,
                              error: response.message!.error[0],
                              onConfirmBtnTap: () {});
                        } else if (response is SignUpEntity &&
                            response.code == "200" &&
                            response.data != null) {
                          ref.watch(isGuestProvider.notifier).state=false;
                          customerNameSaver(name: response.data!.name??'');
                          setUserId(id: response.data!.id ?? 0);
                          userRoleIdSaver(
                              roleId: response.data!.role_id ?? "0");
                          ref.watch(userIdProvider.notifier).state =
                              response.data!.id;
                          userRoleIdRetriever().then((value) => print("user role id retriever $value"));
                          ref.watch(bearerToken.notifier).state =
                              response.data!.token ?? "";
                          debugPrint('here goes');
                          getIt<AddDeviceTokenCubit>().addDeviceToken(
                              bearer_token: "Bearer ${response.data!.token}",
                              device_token: deviceToken);
                          debugPrint('here finishes');
                          bearerTokenSaver(response.data!.token ?? '');
                          if (response.data!.role_id == "2") {
                            return Navigator.of(context).pushNamedAndRemoveUntil(
                                    FIND_PERSONAL_ASSISTANT, (route) => false);
                          } else if (response.data!.role_id == "1") {
                            return Navigator.pushNamedAndRemoveUntil(context,
                                COMPLETE_REGISTRATION, (route) => false);
                          }
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
                                BlocProvider.of<SignUpCubit>(context).signUp(
                                    name: '${ref.watch(signUpFirstNameProvider)}' +
                                        ' ${ref.watch(signUpLastNameProvider)}',
                                    email: ref.watch(signUpEmailProvider),
                                    password: ref.watch(signUpPasswordProvider),
                                    password_confirmation: ref
                                        .watch(signUpConfirmPasswordProvider),
                                    role_id:
                                        ref.watch(signUpAccountTypeIdProvider));
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
                            role_id: ref.watch(signUpAccountTypeIdProvider));
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
                              role_id: ref.watch(signUpAccountTypeIdProvider));
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
