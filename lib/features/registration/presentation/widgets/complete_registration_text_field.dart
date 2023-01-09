import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../style/app_text_style.dart';
import '../business_logic/controller/complete_registration_state_controller.dart';

class CompleteRegistrationTextField extends StatelessWidget {
  const CompleteRegistrationTextField({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,ref,_) {
        return IntlPhoneField(
          initialCountryCode: 'AE',
            decoration:const InputDecoration(
             hintText: 'Phone Number',
           ),
          cursorColor:const Color(0xffD47FA6),
          onChanged: (v){
            ref
                .watch(
                phoneNumberCompleteRegistrationProvider
                    .notifier)
                .state =v.completeNumber;
            print(ref.watch(phoneNumberCompleteRegistrationProvider   ));
          },

        );
      }
    ); /*TextFormField(
       keyboardType: TextInputType.phone,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        contentPadding:  EdgeInsets.symmetric(vertical: 8.h),
        isDense: true,
        hintText: hintText,
        hintStyle: AppTextStyle.appHintStyle,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color:const  Color(0xff707070),
              width: 0.2.h
          ),
        ),
        border: UnderlineInputBorder(
            borderSide: BorderSide(
                color: const Color(0xff707070),
              width: 0.2.h
            )
        ),


      ),cursorColor:const Color(0xffD47FA6),
      validator:validator ,
      onChanged:onChanged ,
    );*/
  }
}
