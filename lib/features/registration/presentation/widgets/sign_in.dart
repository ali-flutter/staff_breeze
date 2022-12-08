import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/domain/entities/sign_in_entity.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/sign_in_state_controller.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/sign_up_state_controller.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/validators.dart';
import 'package:staff_breeze/features/registration/presentation/cubit/sign_in_cubit.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/shaker.dart';
import 'package:staff_breeze/features/registration/presentation/widgets/text_field_widget.dart';
import 'package:staff_breeze/injection_container/injection.dart';
import 'package:staff_breeze/router/app_routes.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/app_text_style.dart';
import '../../../customer/find_personal_assistant/presentation/pages/find_personal_assistant_page.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  late GlobalKey<FormState> formKey;
  late GlobalKey<ShakeWidgetState> shakeEmailKey;
  late GlobalKey<ShakeWidgetState> shakePasswordKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    shakeEmailKey = GlobalKey<ShakeWidgetState>();
    shakePasswordKey = GlobalKey<ShakeWidgetState>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, _) => ShakeWidget(
                key: shakeEmailKey,
                shakeOffset: 10,
                child: TextFieldWidget(
                  hintText: 'Email',
                  validator: (emailValue) {
                    if (emailValue!.trim().isValidEmail) {
                      return null;
                    } else {
                      shakeEmailKey.currentState!.animationController.forward();
                      return 'Please, enter a valid email';
                    }
                  },
                  onChanged: (email) =>
                      ref.watch(signInEmailProvider.notifier).state = email,
                ),
              ),
            ),
            SizedBox(height: 38.h),
            Consumer(
              builder: (context, ref, _) => ShakeWidget(
                key: shakePasswordKey,
                shakeOffset: 10,
                child: TextFieldWidget(
                  hintText: 'Password',
                  obscureText: ref.watch(signInObscurePasswordProvider),
                  suffixIcon: IconButton(
                    icon:Icon(Icons.remove_red_eye),
                    onPressed: (){
                      ref.watch(signInObscurePasswordProvider.notifier).state=!ref.watch(signInObscurePasswordProvider);
                    },
                  ),
                  validator: (passwordValue) {
                    if (passwordValue! != '') {
                      return null;
                    } else {
                      shakePasswordKey.currentState!.animationController
                          .forward();
                      return 'Password field is required';
                    }
                  },
                  onChanged: (password) => ref
                      .watch(singInPasswordProvider.notifier)
                      .state = password,
                  textInputAction: TextInputAction.done,
                ),
              ),
            ),
            SizedBox(height: 64.h),
            Consumer(builder: (context, ref, _) {
              return BlocConsumer<SignInCubit, Result<SignInEntity>>(
                listener: (context, state) {
                  state.when(
                    () => null,
                    loading: () => null,
                    initial: () => null,
                    error: (error, s) => QuickAlert.show(
                      context: context,
                      showCancelBtn: true,
                      type: QuickAlertType.error,
                      backgroundColor: AppColors.scaffoldBackgroundColor,
                      cancelBtnText: 'Cancel',
                      cancelBtnTextStyle: AppTextStyle.buttonTextStyle.copyWith(
                        color: Colors.black45,
                      ),
                      confirmBtnText: 'Retry',
                      confirmBtnTextStyle: AppTextStyle.buttonTextStyle
                          .copyWith(color: Colors.black45),
                      text: error,
                      onCancelBtnTap: () => Navigator.of(context).pop(),
                      confirmBtnColor: AppColors.scaffoldBackgroundColor,
                      onConfirmBtnTap: () {
                        Navigator.of(context).pop();
                        BlocProvider.of<SignInCubit>(context).signIn(
                          email: ref.watch(signInEmailProvider),
                          password: ref.watch(singInPasswordProvider),
                        );
                      },
                    ),
                    success: (response) {
                      if (response.runtimeType == SignInEntity ||
                          response != null) {
                        if (response.user.role_id == 0) {
                          Navigator.pushNamedAndRemoveUntil(context,
                              FIND_PERSONAL_ASSISTANT, (route) => false);
                        } else if (response.user.role_id == 1) {
                          Navigator.pushNamedAndRemoveUntil(context,
                              PERSONAL_ASSISTANT_HOMEPAGE, (route) => false);
                        }
                      } else {}
                    },
                  );
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
                        if(FocusScope.of(context).hasPrimaryFocus){
                          FocusScope.of(context).unfocus();
                        }
                        if (formKey.currentState!.validate()) {
                          if (ref.watch(signUpAccountTypeIdProvider) == 0) {
                            Navigator.pushNamedAndRemoveUntil(context,
                                FIND_PERSONAL_ASSISTANT, (route) => false);
                          } else {
                            Navigator.pushNamedAndRemoveUntil(context,
                                PERSONAL_ASSISTANT_HOMEPAGE, (route) => false);
                          }
                          /* BlocProvider.of<SignInCubit>(context).signIn(
                              email: ref.watch(signInEmailProvider),
                              password: ref.watch(singInPasswordProvider));*/
                        } else {}
                      },
                    ),
                  ),
                  error: (error, s) => AppButtons(
                    buttonText: 'CONTINUE',
                    buttonColor: AppColors.primaryColor,
                    height: 52.h,
                    width: 327.w,
                    buttonTextStyle: AppTextStyle.buttonTextStyle
                        .copyWith(color: Colors.white),
                    onPressed: () {
                      if(FocusScope.of(context).hasPrimaryFocus){
                        FocusScope.of(context).unfocus();
                      }
                      /// TODO I will enable it when Im ready to test registration
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<SignInCubit>(context).signIn(
                            email: ref.watch(signInEmailProvider),
                            password: ref.watch(singInPasswordProvider));
                      } else {}
                    },
                  ),
                  success: (data) => const SizedBox(),
                ),
              );
            }),
            SizedBox(height: 31.h),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, FORGOT_PASSWORD);
              },
              child: Text(
                'FORGOT PASSWORD',
                style: AppTextStyle.lightMainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
