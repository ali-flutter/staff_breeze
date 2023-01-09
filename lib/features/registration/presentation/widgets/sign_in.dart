import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:staff_breeze/core/common_widgets/alert_dialog.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/bearer_token_saver.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/customer_data.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/user_id_saver.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/user_role_id_saver.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/business_logic/controller/personal_assistant_home_page_state_controller.dart';
import 'package:staff_breeze/features/registration/domain/entities/sign_in_entity.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/sign_in_state_controller.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/sign_up_state_controller.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/controller/validators.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/cubit/sign_in_cubit.dart';
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
    return Consumer(
      builder: (context,ref,_) {
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
                        icon: const Icon(Icons.remove_red_eye),
                        onPressed: () {
                          ref.watch(signInObscurePasswordProvider.notifier).state =
                              !ref.watch(signInObscurePasswordProvider);
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
                        error: (error, s) {
                          return AppDialogs.errorDialog(context, error: error??"Something went wrong",
                              onConfirmBtnTap: (){
                                BlocProvider.of<SignInCubit>(context).signIn(
                                    email: ref.watch(signInEmailProvider),
                                    password: ref.watch(singInPasswordProvider));
                              });
                        },
                        success: (response) async{
                         /// TODO  FIND A SOLUTION FOR THE RETRY BUTTON

                          if(response is SignInEntity && response.code =="422"){
                            return AppDialogs.errorDialog(context, error:response.message!.error[0],
                                onConfirmBtnTap: (){
                                 /* BlocProvider.of<SignInCubit>(context).signIn(
                                      email: ref.watch(signInEmailProvider),
                                      password: ref.watch(singInPasswordProvider));*/
                                });
                          }
                          else if (response is SignInEntity && response.code=="200") {
                            ref.watch(isGuestProvider.notifier).state=false;
                            customerNameSaver(name: response.data.name??"");
                            customerPhotoSaver(customerPhoto: response.data.profileImage??'');
                             print(response.data.profileImage);
                             print(await customerPhotoRetriever());
                            userRoleIdSaver(roleId: response.data.role_id??"");
                            setUserId(id: response.data.id??0);
                              ref.watch(bearerToken.notifier).state=response.data.token??'';
                              print(ref.watch(bearerToken));
                              bearerTokenSaver(response.data.token??'');
                            if (response.data.role_id == "1") {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  PERSONAL_ASSISTANT_HOMEPAGE, (route) => false);
                            } else if (response.data.role_id == "2") {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  FIND_PERSONAL_ASSISTANT, (route) => false);
                            }
                          }
                          else if(response is SignInEntity && response.code=="401") {
                            AppDialogs.errorDialogWithOutConfirmButton(
                                context,
                                error:response.message!.error[0] ,
                                );
                          }
                        },
                      );
                    },
                    builder: (context, state) {
                      if(state is Loading){
                        return const Center (
                          child:CircularProgressIndicator()
                        );
                      }else{
                        return AppButtons(
                          buttonText: 'CONTINUE',
                          buttonColor: AppColors.primaryColor,
                          height: 52.h,
                          width: 327.w,
                          buttonTextStyle: AppTextStyle.buttonTextStyle
                              .copyWith(color: Colors.white),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<SignInCubit>(context).signIn(
                                  email: ref.watch(signInEmailProvider),
                                  password: ref.watch(singInPasswordProvider));
                            } else {}
                          },
                        );
                      }
                    }
                  );
                }),
               ref.watch(signUpAccountTypeIdProvider)==2? SizedBox(height: 20.h,):Container(),
               ref.watch(signUpAccountTypeIdProvider)==2? Text('Or Continue as',style: AppTextStyle.appHintStyle,):Container(),
                ref.watch(signUpAccountTypeIdProvider)==2  ?SizedBox(
                  height: 15.h,
                ):Container(),
                ref.watch(signUpAccountTypeIdProvider)==2  ?Consumer(
                    builder: (context, ref, _) => AppButtons(
                      buttonTextStyle: AppTextStyle
                          .buttonTextStyle
                          .copyWith(
                          color: Colors.white,
                      ),
                      buttonText: 'GUEST',
                      buttonColor:
                      const Color(0xff6D7EB4),
                      onPressed: () {
                      ref.watch(isGuestProvider.notifier).state=true;
                       Navigator.pushNamedAndRemoveUntil(context, FIND_PERSONAL_ASSISTANT, (route) => false);
                      },
                      height: 49.h,
                      width: double.infinity,
                    )):Container(),
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
    );
  }
}
