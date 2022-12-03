import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';

import '../../../../../core/network_configration/endpoints.dart';
import '../../model/reset_password_model.dart';
import '../../model/send_forgot_password_email.dart';
part 'send_reset_forgot_password_datasource.g.dart';

 @Singleton()
 @RestApi(baseUrl: baseUrl)
 abstract class SendResetForgotPasswordClient{
 @factoryMethod
 factory SendResetForgotPasswordClient(Dio dio)=_SendResetForgotPasswordClient;
 @POST(sendForgotPasswordEmailEndPoint)
 @MultiPart()
  Future<SendForgotPasswordEmailModel>sendForgotPasswordEmail({
  @Part(name: "email")required String email,
 });
@POST(passwordResetEndPoint)
  @MultiPart()
  Future<ResetPasswordModel>resetPassword({
  @Part(name: "password")required String password,
 @Part(name:"password_confirmation")required String password_confirmation,
 @Part(name:"code")required String code,
 });
 }

