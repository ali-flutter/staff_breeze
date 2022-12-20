// ignore_for_file: non_constant_identifier_names

import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/domain/entities/forgot_password_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/reset_password_entity.dart';

abstract class ForgotResetPasswordRepository{

  Future<Result<ForgotPasswordEntity>>sendForgotPasswordEmail({required String email});
 Future<Result<ResetPasswordEntity>> resetPassword({
   required String password,required String password_confirmation, required String code});

}