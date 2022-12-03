
import 'package:json_annotation/json_annotation.dart';
part 'send_forgot_password_email.g.dart';

@JsonSerializable()
class SendForgotPasswordEmailModel{
  String code;
  String message;
  SendForgotPasswordEmailModel({required this.message,required this.code});
  factory SendForgotPasswordEmailModel.fromJson(Map<String,dynamic>json)=>_$SendForgotPasswordEmailModelFromJson(json);
}