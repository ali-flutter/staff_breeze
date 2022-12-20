// ignore_for_file: non_constant_identifier_names

import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/handle_response.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/data/data_source/network/send_reset_forgot_password_datasource.dart';
import 'package:staff_breeze/features/registration/data/model/reset_password_model.dart';
import 'package:staff_breeze/features/registration/data/model/send_forgot_password_email.dart';
import 'package:staff_breeze/features/registration/domain/entities/forgot_password_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/reset_password_entity.dart';
import 'package:staff_breeze/features/registration/domain/repository/forgot_reset_password_repository.dart';

import '../mapper/forgot_reset_password_mapper.dart';


@Singleton(as: ForgotResetPasswordRepository)
class ForgotResetPasswordRepositoryImp implements ForgotResetPasswordRepository{
  SendResetForgotPasswordClient client;
  ForgotResetPasswordMapper mapper;
  ForgotResetPasswordRepositoryImp({required this.client,required this.mapper});
  @override
  Future<Result<ResetPasswordEntity>> resetPassword({
    required String password,
    required String password_confirmation,
    required String code}) => handleResponse<ResetPasswordModel,ResetPasswordEntity>(
          () =>client.resetPassword(password: password, password_confirmation: password_confirmation, code: code),
          (response) =>mapper.resetPasswordMapper(response) );

  @override
  Future<Result<ForgotPasswordEntity>> sendForgotPasswordEmail({required String email})=>
      handleResponse<SendForgotPasswordEmailModel,ForgotPasswordEntity>(
              () => client.sendForgotPasswordEmail(email: email),
              (response) =>mapper.forgotPasswordMapper(response));


}