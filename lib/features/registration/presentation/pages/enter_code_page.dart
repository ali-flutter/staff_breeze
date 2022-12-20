
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staff_breeze/core/common_widgets/app_buttons.dart';
import 'package:staff_breeze/router/app_routes.dart';
import 'package:staff_breeze/style/app_colors.dart';
import 'package:staff_breeze/style/dimensions_controller.dart';
import '../../../../style/app_text_style.dart';
import '../business_logic/controller/forgot_password_state.dart';
import '../widgets/shaker.dart';

class EnterCodePage extends StatefulWidget {
  const EnterCodePage({Key? key}) : super(key: key);

  @override
  State<EnterCodePage> createState() => _EnterCodePageState();
}

class _EnterCodePageState extends State<EnterCodePage> {
late GlobalKey<FormState>_key;
late GlobalKey<ShakeWidgetState>_shakeWidget;

@override
  void initState() {
    super.initState();
  _key=GlobalKey<FormState>();
  _shakeWidget=GlobalKey<ShakeWidgetState>();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Sizer.w(context, 1),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100.h,
              ),
              Text(
                "Enter the code",
                style: AppTextStyle.appHintStyle.copyWith(
                  color:const Color(0xff241332).withOpacity(0.32),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Consumer(
                builder: (context,ref,_) {
                  return ShakeWidget(
                    key: _shakeWidget,
                         shakeOffset: 10,
                    child: Form(
                      key: _key,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color:ref.watch(forgotPasswordBorderColorProvider),
                          ),
                        ),
                        elevation: 0,
                        child: SizedBox(
                          height: 73.h,
                          width: 316.w,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child:  TextFormField(
                                     textInputAction: TextInputAction.done,
                                    decoration: const InputDecoration(
                                      focusedBorder:
                                          UnderlineInputBorder(borderSide: BorderSide.none),
                                      border:
                                          UnderlineInputBorder(borderSide: BorderSide.none),
                                    ),
                                    onChanged: (codeValue){
                                      ref.watch(forgotPasswordCodeProvider.notifier).state=codeValue;
                                    },
                                    validator: (validator){
                                      if(validator==''||validator!.isEmpty){
                                         ref.watch(forgotPasswordBorderColorProvider.notifier).state=Colors.red;
                                        _shakeWidget.currentState!.animationController.forward();
                                         return null;
                                      }else{
                                      }
                                    },

                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              ),
              SizedBox(
                height: 49.h,
              ),
              AppButtons(
                  buttonText: 'Confirm',
                  buttonTextStyle: AppTextStyle.buttonTextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  buttonColor: AppColors.primaryColor,
                  onPressed: () {
                   if(_key.currentState!.validate()){
                     Navigator.pushNamed(context,NEW_PASSWORD);
                     //AutoRouter.of(context).push(ResetPasswordRoute());
                     print('validate');
                   }
                  },
                  height: 52.h,
                  width: 327.w)
            ],
          ),
        ),
      ),
    );
  }
}
