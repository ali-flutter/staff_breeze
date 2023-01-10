import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/quickalert.dart';

import '../../style/app_colors.dart';
import '../../style/app_text_style.dart';

class AppDialogs {
  static Future<void> errorDialog(BuildContext context,
      {required String error, required void Function()? onConfirmBtnTap}) {
    return QuickAlert.show(
        context: context,
        showCancelBtn: true,
        type: QuickAlertType.error,
        backgroundColor: AppColors.scaffoldBackgroundColor,
        cancelBtnText: 'Cancel',
        cancelBtnTextStyle:
            AppTextStyle.buttonTextStyle.copyWith(color: Colors.black45),
        onCancelBtnTap: () => Navigator.of(context).pop(),
        confirmBtnText: 'Retry',
        confirmBtnTextStyle:
            AppTextStyle.buttonTextStyle.copyWith(color: Colors.black45),
        text: error,
        confirmBtnColor: AppColors.scaffoldBackgroundColor,
        onConfirmBtnTap: onConfirmBtnTap);
  }
  static Future<void> errorDialogWithOutConfirmButton(BuildContext context,
      {required String error}) {
    return QuickAlert.show(
        context: context,
        showCancelBtn: false,
        type: QuickAlertType.error,
        backgroundColor: AppColors.scaffoldBackgroundColor,
        confirmBtnText: 'Ok',
        confirmBtnTextStyle:
        AppTextStyle.buttonTextStyle.copyWith(color: Colors.black45),
        text: error,
        confirmBtnColor: AppColors.scaffoldBackgroundColor,
        onConfirmBtnTap: (){
          Navigator.of(context).pop();
        });
  }
  static Future<void> warningDialog(BuildContext context,
      {required String warning, required void Function()? onConfirmBtnTapped}) {
    return QuickAlert.show(
        context: context,
        backgroundColor: AppColors.scaffoldBackgroundColor,
        type: QuickAlertType.warning,
        title: warning,
        confirmBtnTextStyle: AppTextStyle.buttonTextStyle.copyWith(color: Colors.black45) ,
        confirmBtnColor: AppColors.scaffoldBackgroundColor,
        showCancelBtn: true,
        onCancelBtnTap: ()=>Navigator.of(context).pop(),
        onConfirmBtnTap: onConfirmBtnTapped);
  }
  static Future<void> success(BuildContext context,
      {required String warning, required void Function()? onConfirmBtnTapped}) {
    return QuickAlert.show(
        context: context,
        backgroundColor: AppColors.scaffoldBackgroundColor,
        type: QuickAlertType.success,
        title: warning,
        confirmBtnTextStyle: AppTextStyle.buttonTextStyle.copyWith(color: Colors.black45) ,
        confirmBtnColor: AppColors.scaffoldBackgroundColor,
        showCancelBtn: false,

        onConfirmBtnTap: onConfirmBtnTapped);
  }
}
