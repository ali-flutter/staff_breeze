// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_forgot_password_email.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendForgotPasswordEmailModel _$SendForgotPasswordEmailModelFromJson(
        Map<String, dynamic> json) =>
    SendForgotPasswordEmailModel(
      message: json['message'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$SendForgotPasswordEmailModelToJson(
        SendForgotPasswordEmailModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
